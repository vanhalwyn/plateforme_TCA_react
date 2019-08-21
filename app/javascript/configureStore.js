import { createStore, applyMiddleware } from "redux";

import thunk from 'redux-thunk';

const initialState = {
  timeslots: []
};

function rootReducer(state, action) {
  switch (action.type) {
    case "GET_TIMESLOTS_SUCCESS":
      return { timeslots: action.json.timeslots };
  }
  return state;
}

export default function configureStore() {
  const store = createStore(
    rootReducer,
    initialState,
    applyMiddleware(thunk)
  );
  return store;
}
