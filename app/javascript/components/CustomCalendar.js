import React from "react";

import { connect } from 'react-redux';
import { createStructuredSelector } from 'reselect';

import Calendar from 'react-calendar';

const GET_TIMESLOTS_REQUEST = 'GET_TIMESLOTS_REQUEST';
const GET_TIMESLOTS_SUCCESS = 'GET_TIMESLOTS_SUCCESS';

function getTimeslots(date) {
  console.log('getTimeslots() Action!!')
  return dispatch => {
    dispatch({ type: GET_TIMESLOTS_REQUEST });
    return fetch(`appointments.json?date=${date}`)
      .then(response => response.json())
      .then(json => dispatch(getTimeslotsSuccess(json)))
      .catch(error => console.log(error));
  };
};

export function getTimeslotsSuccess(json) {
  return {
    type: GET_TIMESLOTS_SUCCESS,
    json: json
  };
};

class CustomCalendar extends React.Component {
  state = {
    date: null
  }

  onChange = date => {
    console.log(date);
    this.props.getTimeslots(date);
    this.setState({ date });
  }

  render() {
    console.log("render");
    const begin = new Date();
    const end = new Date();
    end.setDate(begin.getDate() + 365);

    const compareDates = (date1, date2) => {
      return date1.getDate() === date2.getDate() && date1.getMonth() === date2.getMonth() && date1.getYear() === date2.getYear();
    }

    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };

    const allTimeslots = [8, 9, 10, 11, 13, 14, 15, 16, 17];

    const { appointments } = this.props;

    let timeslotForm = null;

    if (appointments != null) {
      timeslotForm =
        <form action="" method="get" className="form-example">
          <input hidden type="text" name="date" id="date" value={ this.state.date } required />

          <div>{
            allTimeslots.map((timeslot) => {
              console.log("a")
              if (appointments.includes(timeslot)) {
                return (
                  <div key={timeslot}>
                    <input disabled type="radio" id={timeslot} name="timeslot" value={timeslot} />
                    <label for={timeslot}>{timeslot}</label>
                  </div>
                )
              } else {
                return (
                  <div key={timeslot}>
                    <input type="radio" id={timeslot} name="timeslot" value={timeslot} />
                    <label for={timeslot}>{timeslot}</label>
                  </div>
                )
              }
            })

           }</div>

          <div className="form-example">
            <input type="submit" value="Valider" />
          </div>
        </form>
    }

    return (
      <React.Fragment>
        <Calendar
          minDate={begin}
          maxDate={end}
          minDetail={"decade"}
          tileDisabled={({activeStartDate, date, view }) => (compareDates(date, new Date(2019, 7, 20))) || (date.getDay() === 0)}
          onChange={this.onChange}
          value={this.state.date}
        />
        <div>{ timeslotForm }</div>
      </React.Fragment>
    )
  }
}

const structuredSelector = createStructuredSelector({
  appointments: state => state.appointments
})

const mapDispatchToProps = { getTimeslots };

export default connect(structuredSelector, mapDispatchToProps)(CustomCalendar);

