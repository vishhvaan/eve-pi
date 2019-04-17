#!/usr/bin/python3

import sys
import time
import configparser
import fileinput
from slackclient import SlackClient
from datetime import datetime
import eve


mstart_time = datetime.now()
config = configparser.ConfigParser()
config.read('eve-conf.ini')

mchan = config['MAIN']['slack_channel']

totsys = (''.join(config.sections())).count('EVE')

slack_client = SlackClient(config['MAIN']['slack_key'])
if slack_client.rtm_connect():
    print ('Multiplexer Started.')
    if (totsys == 1):
        multimess = slack_client.api_call(
            "chat.postMessage",
            username = 'Multiplexer',
            icon_url = config['MAIN']['multi_icon'],
            channel=config['MAIN']['slack_channel'],
            text = mstart_time.strftime('Started at %H:%M:%S on %a - %b %d, %Y. There is ' + str(totsys) + ' system configured.')
            )
    else:
        multimess = slack_client.api_call(
            "chat.postMessage",
            username = 'Multiplexer',
            icon_url = config['MAIN']['multi_icon'],
            channel=config['MAIN']['slack_channel'],
            text = mstart_time.strftime('Started at %H:%M:%S on %a - %b %d, %Y. There are ' + str(totsys) + ' systems configured.')
            )
else:
    sys.exit("No connection to Slack.")

chanid = multimess['channel']
multits = multimess['ts']

# channels = slack_client.api_call("channels.list")
# chanid = None
# for channel in channels['channels']:
#     if channel['name'] == config['MAIN']['slack_channel']:
#         chanid = channel['id']

# for line in fileinput.input('eve-conf.ini', inplace=1):
#     if 'slack_chanid' in line:
#         line = 'slack_chanid = ' + chanid + '\n'
#     sys.stdout.write(line)

morbidostats = list()

for sysitr in range(totsys):
    sysnum = sysitr + 1
    confsec = 'EVE' + str(sysnum)
    if config[confsec].getboolean('enabled') is True:
        print (confsec + ' enabled.')
        morbidostats.append([eve.Morbidostat(sysnum), sysnum])
        #Morbidostat(sysnum)
        # thread.join
    else:
        print (confsec + ' not enabled. Skipping.')
        slack_client.api_call(
            "chat.postMessage",
            username = 'Multiplexer',
            icon_url = config['MAIN']['multi_icon'],
            channel=mchan,
            text = confsec + ' is not enabled. Skipping.'
            )

print ('Starting EVEs')
for starti in range(len(morbidostats)):
   morbidostats[starti][0].start()

while True:
    try:
        events = slack_client.rtm_read()
        for event in events:
            for sysitr in range(len(morbidostats)):
                sysnum = morbidostats[sysitr][1]
                evename = 'EVE' + str(sysnum)
                if (
                    event.get('channel') == chanid and
                    event.get('text') == evename and
                    event.get('thread_ts') == multits and
                    event.get('type') == 'message'
                ):
                    # print(event)
                    slack_client.api_call(
                        "chat.postMessage",
                        username = 'Multiplexer',
                        icon_url = config['MAIN']['multi_icon'],
                        channel=mchan,
                        text = 'Generating Graphs for ' + evename,
                        thread_ts= multits
                        )
                    morbidostats[sysitr][0].graphOD()
        time.sleep(5)
    except KeyboardInterrupt:
        break
    except:
        pass



# for mrunner in range(len(morbidostats)):

