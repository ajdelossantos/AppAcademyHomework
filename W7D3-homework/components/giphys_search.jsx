import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor () {
    super();
    this.state = {
      searchTerm: "puppies"
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();
  }

  handleChange(event) {
    this.setState({ searchTerm: event.currentTarget.value });
  }

  render () {
    return (
      <div>
        <form>
          <input type="text" onChange={this.handleChange} value={this.searchTerm}></input>
          <button type="submit" onClick={this.handleSubmit}>Search!</button>
        </form>
      </div>

    );
  }

}

export default GiphysSearch;
