import React from 'react';
import axios from 'axios';

import Loading from '../shared/Loading';
import SearchField from '../shared/SearchField';
import ArtistSearchResults from './ArtistSearchResults';

class ArtistSearch extends React.Component {
  constructor(props) {
    super(props);

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);

    this.handleAdd = this.handleAdd.bind(this);
    this.handleRemove = this.handleRemove.bind(this);
    this.handlePause = this.handlePause.bind(this);
    this.handleUnpause = this.handleUnpause.bind(this);

    this.state = {
      searching: false,
      searchResults: [],
    };
  }

  // AJAX callbacks

  handleError(error) {
    console.error(error);
  }

  handleSuccess(response) {
    this.setState({ searchResults: [] });
  }

  // Event handlers

  handleSubmit(e) {
    e.preventDefault();
    const data = { params: this.state.search };
    const service_id = this.props.service.id;

    this.setState({ searching: true })

    axios.get(`/api/music_downloads/services/${service_id}/artists/search.json`, data)
      .then((response) => {
        this.setState({
          searching: false,
          searchResults: response.data,
        });
      })
      .catch((error) => {
        this.setState({ searching: false });
        console.log(error);
      });
  }

  handleChange(e) {
    const name = e.target.name;
    const value = e.target.value;

    this.setState({ search: { [name]: value } });
  }

  handleAdd(artist) {
    const service_id = this.props.service.id;
    const data = { registration: { id: artist.id } };

    axios.post(`/api/music_downloads/services/${service_id}/artists/registrations.json`, data)
      .then(this.handleSuccess.bind(this))
      .catch(this.handleError.bind(this));
  }

  handleRemove(artist) {
    const service_id = this.props.service.id;

    axios.delete(`/api/music_downloads/services/${service_id}/artists/registrations/${artist.id}.json`)
      .then(this.handleSuccess.bind(this))
      .catch(this.handleError.bind(this));
  }

  handlePause(artist) {
    console.log('Not implemented yet!'); // TODO
  }

  handleUnpause(artist) {
    console.log('Not implemented yet!'); // TODO
  }

  render() {
    let child;
    if (this.state.searching) {
      child = <Loading />;
    } else if (this.state.searchResults.length > 0) {
      child = (
        <ArtistSearchResults
          results={this.state.searchResults}
          onAdd={this.handleAdd}
          onRemove={this.handleRemove}
          onPause={this.handlePause}
          onUnpause={this.handleUnpause}
        />
      );
    }


    return (
      <div className="header-search">
        <SearchField onSubmit={this.handleSubmit} onChange={this.handleChange} type="artist" />
        {child}
      </div>
    );
  }
}

export default ArtistSearch;
