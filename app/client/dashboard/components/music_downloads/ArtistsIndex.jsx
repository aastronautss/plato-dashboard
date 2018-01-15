import React from 'react';
import axios from 'axios';

import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import {
  fetchArtistsIfNeeded, invalidateArtists, refreshArtists,
} from '../../actions/MusicDownloadsActions';

import ScrollBar from 'react-perfect-scrollbar';

import Loading from '../shared/Loading';
import Artist from './Artist';

class ArtistsIndex extends React.Component {
  constructor(props) {
    super(props);

    this.handleAdd = this.handleAdd.bind(this);
    this.handleRemove = this.handleRemove.bind(this);
    this.handlePause = this.handlePause.bind(this);
    this.handleUnpause = this.handleUnpause.bind(this);
  }

  // AJAX Callbacks

  handleError(error) {
    console.error(error);
  }

  updateArtistStatus(artist, newStatus) {
    this.setState((prevState, props) => {
      const clonedArtists = prevState.artists.slice(0);
      const idx = clonedArtists.findIndex((ele) => ele.id === artist.id);
      clonedArtists[idx].status = newStatus;

      return { artists: clonedArtists };
    });
  }

  // Event listeners

  handleAdd(artist) {
    const service_id = this.props.service.id;
    const data = { registration: { id: artist.id } };

    axios.post(`/api/music_downloads/services/${service_id}/artists/registrations.json`, data)
      .then(() => this.updateArtistStatus.bind(this)(artist, 'Active'))
      .catch(this.handleError.bind(this));
  }

  handleRemove(artist) {
    const service_id = this.props.service.id;

    axios.delete(`/api/music_downloads/services/${service_id}/artists/registrations/${artist.id}.json`)
      .then(() => this.updateArtistStatus.bind(this)(artist, 'Inactive'))
      .catch(this.handleError.bind(this));
  }

  handlePause(artist) {
    console.log('Not implemented yet!'); // TODO
  }

  handleUnpause(artist) {
    console.log('Not implemented yet!'); // TODO
  }

  // Lifecycle hooks

  componentDidMount() {
    this.props.fetchArtistsIfNeeded();
  }

  render() {
    let children;
    if (this.props.artists.length === 0) {
      children = <Loading />;
    } else {
      children = this.props.artists.map(artist => {
        return (
          <Artist
            key={artist.id}
            data={artist}

            onClick={this.props.onClick}
            onRemove={this.handleRemove}
            onAdd={this.handleAdd}
            onPause={this.handlePause}
            onUnpause={this.handleUnpause}
          />
        );
      });
    }

    return (
      <div>
        <header>
          <h3>Artists</h3>
        </header>

        <article>
          <ScrollBar>
            {children}
          </ScrollBar>
        </article>
      </div>
    )
  }
}

const mapStateToProps = (state) => ({
  artists: state.artists.items,
  loading: state.artists.isFetching,
});

const mapDispatchToProps = (dispatch) => bindActionCreators({
  fetchArtistsIfNeeded,
  invalidateArtists,
  refreshArtists,
}, dispatch);

export default connect(mapStateToProps, mapDispatchToProps)(ArtistsIndex);
