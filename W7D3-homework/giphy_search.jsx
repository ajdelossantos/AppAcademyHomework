import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

//TODO remove after debugging
// import { fetchSearchGiphys } from './util/api_util';
// import { receiveSearchGiphys, fetchSearchGiphys }from './actions/giphy_actions';
//
// const debugVars = (store) => {
//   window.store = store;
//   window.fetchSearchGiphys = fetchSearchGiphys;
//   window.receiveSearchGiphys = receiveSearchGiphys;
// };

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();

  //TODO remove after debugging
  // debugVars(store);

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={ store } />, root);
});
