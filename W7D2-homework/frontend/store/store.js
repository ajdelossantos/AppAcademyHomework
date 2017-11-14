import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  //TODO This returns an infinite loop. Bad news.
  const store = createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatch)
  );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState()); // old state
  console.log(action);

  // IDEA checked solutions, use next();
  // store.dispatch(action);
  next(action);

  console.log(store.getState()); // new state
};

export default configureStore;
