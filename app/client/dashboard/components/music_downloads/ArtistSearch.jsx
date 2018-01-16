import React from 'react';
import axios from 'axios';

import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { searchArtist, clearSearchArtist } from '../../actions/MusicDownloadsActions';

import ScrollBar from 'react-perfect-scrollbar';

import Loading from '../shared/Loading';
import SearchField from '../shared/SearchField';
import ClickOutsider from '../shared/ClickOutsider';
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

    this.handleFocus = this.handleFocus.bind(this);
    this.handleBlur = this.handleBlur.bind(this);

    this.handleClickOutside = this.handleClickOutside.bind(this);

    this.state = {
      active: false,
    };
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

    return null;
  }

  // Event handlers

  handleClickOutside(e) {
    this.props.clearSearchArtist();
    this.setState({ active: false });
  }

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

  handleFocus(e) {
    this.setState({ active: true });
  }

  handleBlur(e) {
    this.setState({ active: this.props.searchResults.length > 0 });
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
        <ClickOutsider onClickOutside={this.handleClickOutside}>
          <div className="header-search-wrapper">
            <div className={`header-search-content${this.state.active ? ' active' : ''}`}>
              <SearchField
                onSubmit={this.handleSubmit}
                onChange={this.handleChange}
                onFocus={this.handleFocus}
                onBlur={this.handleBlur}

                type="artist"
              />

              <div className="header-search-results-wrapper">
                <div className={`header-search-results${!content ? ' hidden' : ''}`}>
                  {
                    content &&
                    <ScrollBar>
                      {content}
                    </ScrollBar>
                  }
                </div>
              </div>
            </div>
          </div>
        </ClickOutsider>
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
  clearSearchArtist,
}, dispatch);

export default connect(mapStateToProps, mapDispatchToProps)(ArtistSearch);
