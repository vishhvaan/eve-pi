#!/usr/bin/python3

import dash
import dash_core_components as dcc
import dash_html_components as html
import pandas as pd
import plotly.graph_objs as go
from dash.dependencies import Input, Output

external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

outfile_OD = "/mnt/morbidodata/EVE1/2019-03-19 17:15:19.193838/ODdata_2019-03-19 17:15:19.193838.csv"
allODs = pd.read_csv(outfile_OD)

app.layout = html.Div(children=[
    html.H1(children='EVE Graphs'),

    # html.Div(children='''
        # Dash: A web application framework for Python.
    # '''),

    dcc.Graph(
        id='EVE1'),

    dcc.RadioItems(
        id = 'opts',
        options=[
            {'label': 'OD', 'value': 'od'},
            {'label': 'Pumps', 'value': 'pumps'},
            {'label': 'Drug Conc', 'value': 'conc'},
            {'label': 'Threads', 'value': 'thr'}
        ],
        value='od',
        labelStyle={'display': 'inline-block'}
    )
])

@app.callback(
    Output('EVE1','figure'),
    [Input('opts', 'value')]
)
def update_figure(opts):
    if opts == 'od':
        return {
                'data': [
                    go.Scatter(
                        x=allODs['hour'],
                        y=allODs['average'],
                        text='od',
                        # mode='markers',
                        # opacity=0.7,
                        # marker={
                            # 'size': 15,
                            # 'line': {'width': 0.5, 'color': 'white'}
                        # },
                        name='od'
                    )
                ],
                'layout': go.Layout(
                    xaxis={'title': 'GDP Per Capita'},
                    yaxis={'title': 'Life Expectancy'},
                    margin={'l': 40, 'b': 40, 't': 10, 'r': 10},
                    legend={'x': 0, 'y': 1},
                    hovermode='closest'
                )
            }
    elif opts == 'thr':
        return {
                'data': [
                    go.Scatter(
                        x=allODs['hour'],
                        y=allODs['average'],
                        text='od',
                        name='od'
                    ),
                    go.Scatter(
                        x=allODs['hour'],
                        y=allODs['threads'],
                        yaxis='y2',
                        text='od',
                        name='od'
                    )
                ],
                'layout': go.Layout(
                    xaxis={'title': 'GDP Per Capita'},
                    yaxis={'title': 'Life Expectancy'},
                    yaxis2={'title': 'Life Expectancy', 'side':'right'},
                    margin={'l': 40, 'b': 40, 't': 10, 'r': 10},
                    legend={'x': 0, 'y': 1},
                    hovermode='closest'
                )
            }


if __name__ == '__main__':
    app.run_server(debug=True, host='eve2.ccf.org')
