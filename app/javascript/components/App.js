import React from "react"
import PropTypes from "prop-types"

import { BrowserRouter, Switch, Route } from 'react-router-dom'

import { Provider } from 'react-redux'

import configureStore from '../configureStore'
const store = configureStore();

import CustomCalendar from './CustomCalendar'

class App extends React.Component {
  render () {
    return (
      <Provider store={store}>
        <BrowserRouter>
          <Switch>
            <Route exact path="/reservations" render={() => <CustomCalendar />} />
          </Switch>
        </BrowserRouter>
      </Provider>
    );
  }
}

export default App
