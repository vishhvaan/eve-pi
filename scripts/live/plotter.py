#!/usr/bin/python3

import dash
import dash_core_components as dcc
import dash_html_components as html
import pandas as pd
import plotly.graph_objs as go
from plotly import tools
from dash.dependencies import Input, Output

class Plotter:

    def __init__(self,sysarr,ODcsvs, pumpcsvs, hostname):

        self.external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

        self.app = dash.Dash(__name__, external_stylesheets=self.external_stylesheets)

        self.hostname = hostname

        # self.allODs = []
        # self.allpumps = []
        self.evenames = []
        self.evesel = []

        self.outODs = ODcsvs
        self.outpumps = pumpcsvs
        # for i in range(len(self.outODs)): self.allODs.append(pd.read_csv(self.outODs[i]))
        # for i in range(len(self.outpumps)): self.allpumps.append(pd.read_csv(self.outpumps[i]))

        for i in sysarr:
            self.evenames.append('EVE' + str(i))
            self.evesel.append({'label':'EVE' + str(i), 'value': 'EVE' + str(i)})

        tabs_styles = {
            'height': '44px'
        }
        tab_style = {
            'borderBottom': '1px solid #d6d6d6',
            'padding': '6px',
            'fontWeight': 'bold'
        }

        tab_selected_style = {
            'borderTop': '1px solid #d6d6d6',
            'borderBottom': '1px solid #d6d6d6',
            'backgroundColor': '#119DFF',
            'color': 'white',
            'padding': '6px'
        }

        self.app.layout = html.Div(children=[
            html.H1(children='The EVE Plotter', style={'textAlign': 'center'}),

            dcc.Tabs(id="tabs-styled-with-inline", value='overview', children=[
                    dcc.Tab(label='Overview', value='overview', style=tab_style, selected_style=tab_selected_style),
                    dcc.Tab(label='Pumps', value='pumps', style=tab_style, selected_style=tab_selected_style),
                    dcc.Tab(label='Drug Concentration', value='drug-conc', style=tab_style, selected_style=tab_selected_style),
                    dcc.Tab(label='Threads', value='threads', style=tab_style, selected_style=tab_selected_style),
                ], style=tabs_styles),
                # html.Div(id='tabs-content-inline'),

            dcc.Dropdown(
                options=self.evesel,
                multi=True,
                value=self.evenames,
                id = 'e-select'
            ),

            dcc.Graph(
                id='egraph', style={'textAlign': 'center'})

        ])

        @self.app.callback(
            Output('egraph','figure'),
            [Input('tabs-styled-with-inline', 'value'),
            Input('e-select', 'value')]
        )
        def update_figure(tabs,esel):
            traces = []
            self.allODs = []
            self.allpumps = []
            for i in range(len(self.outODs)): self.allODs.append(pd.read_csv(self.outODs[i]))
            for i in range(len(self.outpumps)): self.allpumps.append(pd.read_csv(self.outpumps[i]))

            if esel == []: return None

            if tabs == 'overview':
                for evenum in esel:
                    odtemp = self.allODs[self.evenames.index(evenum)]
                    pumptemp = self.allpumps[self.evenames.index(evenum)]
                    traces.append([
                        go.Scatter(
                            x=odtemp['hour'],
                            y=odtemp['average'],
                            text='OD',
                            mode = 'lines',
                            name='['+evenum+'] Optical Density'
                        ),
                        go.Scatter(
                            x=odtemp['hour'],
                            y=pumptemp['media'],
                            yaxis='y2',
                            text='Media',
                            name='['+evenum+'] Media',
                            mode = 'lines',
                        ),
                        go.Scatter(
                            x=odtemp['hour'],
                            y=pumptemp['drug'],
                            yaxis='y2',
                            text='Drug',
                            name='['+evenum+'] Drug',
                            mode = 'lines',
                        ),
                        go.Scatter(
                            x=odtemp['hour'],
                            y=pumptemp['waste'],
                            yaxis='y2',
                            text='Waste',
                            name='['+evenum+'] Waste',
                            mode = 'lines',
                        ),
                        go.Scatter(
                            x=odtemp['hour'],
                            y=pumptemp['drug_mass']/12,
                            text='Concentration',
                            name='['+evenum+'] Concentration',
                            mode = 'lines',
                        ),
                        go.Scatter(
                            x=odtemp['hour'],
                            y=odtemp['threads'],
                            # yaxis='y3',
                            text='Threads',
                            name='['+evenum+'] Threads',
                            mode = 'markers',
                            # marker = go.scatter.Marker(color = 'purple')
                        )])

                # fig = tools.make_subplots(rows=3, cols=1, specs=[[{}], [{}], [{}]],
                                  # shared_xaxes=True, shared_yaxes=True,
                                  # vertical_spacing=0.001)
                fig = tools.make_subplots(rows=4, cols=len(esel),
                                  shared_xaxes=True, shared_yaxes=True,
                                  vertical_spacing=0.001)

                for i in range(len(esel)):
                    fig.append_trace(traces[i][0], 1, i+1)
                    fig.append_trace(traces[i][1], 2, i+1)
                    fig.append_trace(traces[i][2], 2, i+1)
                    fig.append_trace(traces[i][3], 2, i+1)
                    fig.append_trace(traces[i][4], 3, i+1)
                    fig.append_trace(traces[i][5], 4, i+1)

                fig['layout'].update(height=1200, width=800*len(esel))

                # fig['layout']['yaxis2'].update(title = 'Threads', overlaying = 'y', side = 'right'),

                return fig

            elif tabs == 'pumps':
                for evenum in esel:
                    odtemp = self.allODs[self.evenames.index(evenum)]
                    pumptemp = self.allpumps[self.evenames.index(evenum)]
                    traces.append([
                        go.Scatter(
                            x=odtemp['hour'],
                            y=odtemp['average'],
                            text='OD',
                            mode = 'lines',
                            name='['+evenum+'] Optical Density'
                        ),
                        go.Scatter(
                            x=odtemp['hour'],
                            y=pumptemp['media'],
                            yaxis='y3',
                            text='Media',
                            name='['+evenum+'] Media',
                            mode = 'lines',
                        ),
                        go.Scatter(
                            x=odtemp['hour'],
                            y=pumptemp['drug'],
                            yaxis='y3',
                            text='Drug',
                            name='['+evenum+'] Drug',
                            mode = 'lines',
                        ),
                        go.Scatter(
                            x=odtemp['hour'],
                            y=pumptemp['waste'],
                            yaxis='y3',
                            text='Waste',
                            name='['+evenum+'] Waste',
                            mode = 'lines',
                        )
                        ])

                # fig = tools.make_subplots(rows=3, cols=1, specs=[[{}], [{}], [{}]],
                                  # shared_xaxes=True, shared_yaxes=True,
                                  # vertical_spacing=0.001)
                fig = tools.make_subplots(rows=1, cols=len(esel),
                                  shared_xaxes=True,
                                  vertical_spacing=0.001)

                for i in range(len(esel)):
                    fig.append_trace(traces[i][0], 1, i+1)
                    fig.append_trace(traces[i][1], 1, i+1)
                    fig.append_trace(traces[i][2], 1, i+1)
                    fig.append_trace(traces[i][3], 1, i+1)

                fig['layout'].update(height=600, width=800*len(esel))

                # fig['layout']['yaxis2'].update(title = 'Media', overlaying = 'y', side = 'right'),

                return fig

            elif tabs == 'threads':
                for evenum in esel:
                    odtemp = self.allODs[self.evenames.index(evenum)]
                    pumptemp = self.allpumps[self.evenames.index(evenum)]
                    traces.append([
                        go.Scatter(
                            x=odtemp['hour'],
                            y=odtemp['average'],
                            text='od',
                            mode = 'lines',
                            name='['+evenum+'] Optical Density'
                        ),
                        go.Scatter(
                            x=odtemp['hour'],
                            y=odtemp['threads'],
                            # yaxis='y3',
                            text='threads',
                            name='['+evenum+'] Threads',
                            mode = 'markers',
                            # marker = go.scatter.marker(color = 'purple')
                        )
                        ])

                # fig = tools.make_subplots(rows=3, cols=1, specs=[[{}], [{}], [{}]],
                                  # shared_xaxes=true, shared_yaxes=true,
                                  # vertical_spacing=0.001)
                fig = tools.make_subplots(rows=1, cols=len(esel),
                                  shared_xaxes=True,
                                  vertical_spacing=0.001)

                for i in range(len(esel)):
                    fig.append_trace(traces[i][0], 1, i+1)
                    fig.append_trace(traces[i][1], 1, i+1)

                fig['layout'].update(height=600, width=800*len(esel))


                return fig

            elif tabs == 'drug-conc':
                for evenum in esel:
                    odtemp = self.allODs[self.evenames.index(evenum)]
                    pumptemp = self.allpumps[self.evenames.index(evenum)]
                    traces.append([
                        go.Scatter(
                            x=odtemp['hour'],
                            y=odtemp['average'],
                            text='od',
                            mode = 'lines',
                            name='['+evenum+'] Optical Density'
                            ),
                        go.Scatter(
                            x=odtemp['hour'],
                            y=pumptemp['drug_mass']/12,
                            text='Concentration',
                            name='['+evenum+'] Concentration',
                            mode = 'lines',
                        )
                        ])

                fig = tools.make_subplots(rows=1, cols=len(esel),
                                  shared_xaxes=True,
                                  vertical_spacing=0.001)

                for i in range(len(esel)):
                    fig.append_trace(traces[i][0], 1, i+1)
                    fig.append_trace(traces[i][1], 1, i+1)

                fig['layout'].update(height=600, width=800*len(esel))


                return fig


        # if __name__ == '__main__':
            # self.app.run_server(debug=True, host='eve.ccf.org')

        self.app.run_server(host=self.hostname)

