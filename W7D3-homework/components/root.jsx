import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';

//IDEA takes store as a prop object
const Root = ({ store }) => {
  return (
    <Provider store={store}>
      <GiphysSearchContainer />
    </Provider>
  );
};

export default Root;
