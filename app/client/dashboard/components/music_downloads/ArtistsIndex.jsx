import React from 'react';

import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import {
  fetchArtistsIfNeeded, invalidateArtists, refreshArtists,
  addArtist, removeArtist,
} from '../../actions/MusicDownloadsActions';

import ScrollBar from 'react-perfect-scrollbar';

import Loading from '../shared/Loading';
import Artist from './Artist';

class ArtistsIndex extends React.Component {
  constructor(props) {
    super(props);

    this.handlePause = this.handlePause.bind(this);
    this.handleUnpause = this.handleUnpause.bind(this);
  }

  generateContent() {
    if (this.props.artists.length === 0) {
      return <Loading />;
    } else {
      return this.props.artists.map(artist => (
        <Artist
          key={artist.id}
          data={artist}

          onClick={this.props.onClick}
          onRemove={this.props.removeArtist}
          onAdd={this.props.addArtist}
          onPause={this.handlePause}
          onUnpause={this.handleUnpause}
        />
      ));
    }
  }

  // AJAX Callbacks

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
    const content = this.generateContent();

    return (
      <div>
        <header className="clearfix">
          <h3 className="pull-left">Artists</h3>
          <div className="pull-right">
            <button className="btn btn-sm" onClick={this.props.refreshArtists} disabled={this.props.loading}>
              <span className="glyphicon glyphicon-refresh"></span>
            </button>
          </div>
        </header>

        <article>
          <ScrollBar>
            {content}
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

  addArtist,
  removeArtist,
}, dispatch);

export default connect(mapStateToProps, mapDispatchToProps)(ArtistsIndex);
