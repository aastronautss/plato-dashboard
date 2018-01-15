import React from 'react';
import axios from 'axios';

import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { searchArtist } from '../../actions/MusicDownloadsActions';

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
  }

  generateContent() {
    if (this.props.searching) {
      return <Loading />;
    } else if (this.props.searchResults.length > 0) {
      return (
        <ArtistSearchResults
          results={this.props.searchResults}
          onAdd={this.handleAdd}
          onRemove={this.handleRemove}
          onPause={this.handlePause}
          onUnpause={this.handleUnpause}
        />
      );
    }
  }

  // Event handlers

  handleSubmit(e) {
    e.preventDefault();
    const searchData = { params: this.state.search };

    this.props.searchArtist(searchData);
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
    const content = this.generateContent();

    return (
      <div className="header-search">
        <SearchField onSubmit={this.handleSubmit} onChange={this.handleChange} type="artist" />
        {content}
      </div>
    );
  }
}

const mapStateToProps = (state) => ({
  isSearching: state.artists.isSearching,
  searchResults: state.artists.searchResults,
});

const mapDispatchToProps = (dispatch) => bindActionCreators({
  searchArtist,
}, dispatch);

export default connect(mapStateToProps, mapDispatchToProps)(ArtistSearch);
