import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // let store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store);
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

//IDEA moved to store.js
// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState()); // old state
//   console.log(action);
//
//   store.dispatch(action);
//
//   console.log(store.getState()); // new state
// };

const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;

  middlewares.forEach( (middleware) => {
    dispatch = middleware(store)(dispatch);
  });

  return Object.assign({}, store, { dispatch });
};
