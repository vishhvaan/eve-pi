#!/usr/bin/python3
import configparser

config = configparser.ConfigParser()
config.read('../test/multiplex2/eve-conf.ini')

def int_imp(inp):
    while True:
        try:
            int(inp)
            break
        except ValueError:
            print('Input has to be a number.')
            inp = input('Select again: ')
    return int(inp)

def section_select(config):
    csections = config.sections()
    for section in csections:
        print('{:>2}. {}'.format(csections.index(section),section))

    num = len(csections)
    print('% 2.0f. View All' % (num))
    num2 = num + 1
    print('%- 2.0f. Save File' % (num2))
    num3 = num2 + 1
    print('% 2.0f. Exit' % (num3))
    while True:
        inp = input('Select section to edit/option: ')
        inp = int_imp(inp)
        print()

        if inp == num:
            print_conf(config)
            break
        elif inp == num2:
            save_file(config)
            break
        elif inp == num3:
            print('Editor Closed')
            break
        elif inp < 0 or inp > num3:
            print('Try again')
        else:
            item_editor(config, csections[inp])
            break

def menu():
    print()
    print('Menu')
    print('{:>2}. Edit a Section'.format(0))
    print('{:>2}. View File'.format(1))
    print('{:>2}. Save File'.format(2))
    print('{:>2}. Exit'.format(3))
    while True:
        inp = input('Select option: ')
        inp = int_imp(inp)
        print()

        if inp == 0:
            section_select(config)
            break
        elif inp == 1:
            print_conf(config)
            break
        elif inp == 2:
            save_file(config)
            break
        elif inp == 3:
            print('Editor Closed')
            break
        elif inp < 0 or inp > 3:
            print('Try again')

def print_conf(config):
    csections = config.sections()
    for section in csections:
        print()
        print('Section: %s' % (csections[csections.index(section)]))
        items = config.items(csections[csections.index(section)])

        for item in items:
            print('{:>2}. {:<24}: {}'.format(items.index(item),item[0], item[1]))
    menu()

def save_file(config):
    with open('../test/multiplex2/eve-conf.ini', 'w') as cfgfile:
        config.write(cfgfile)
    cfgfile.close()
    print('Config Saved')
    menu()

def item_editor(config, section):
    csections = config.sections()
    items = config.items(section)
    print('Section: {}'.format(section))
    for item in items:
        print('{:>2}. {:<24}: {}'.format(items.index(item),item[0], item[1]))
    print()
    menu_b = items.index(item) + 1
    print('{:>2}. Back'.format(menu_b))
    inp2 = input('Select key to edit: ')
    inp2 = int_imp(inp2)
    if inp2 == menu_b:
        menu()
    elif inp2 < 0 or inp2 > menu_b:
        print('Try Agin')
        item_editor(config, section)
    else:
        inp2 = int_imp(inp2)
        change = input('New value: ')

        old_value = config[section][items[inp2][0]]
        config.set(section,items[inp2][0],change)

        print()
        print('Section: %s' % (section))
        items = config.items(section)
        for item in items:
            print('{:>2}. {:<24}: {}'.format(items.index(item),item[0], item[1]))

        conf = input('Confim Change [y,N]: ')
        if conf == 'y' or conf == 'Y':
            print('Config File Edited.')
        else:
            config.set(section,items[inp2][0],old_value)
            print('Config File Not Changed.')

        print()
        another = input('Edit another key in this section [y,N]: ')
        if another == 'y' or another == 'Y':
            print()
            item_editor(config,section)
        else:
             menu()

section_select(config)
