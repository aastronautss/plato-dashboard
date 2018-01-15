import React from 'react';

import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import {
  fetchAlbumsIfNeeded, invalidateAlbums, refreshAlbums,
  addAlbum, removeAlbum,
} from '../../actions/MusicDownloadsActions';

import ScrollBar from 'react-perfect-scrollbar';

import Loading from '../shared/Loading';
import Album from './Album';

class AlbumsIndex extends React.Component {
  componentDidMount() {
    this.props.fetchAlbumsIfNeeded();
  }

  render() {
    let child;
    if (this.props.loading) {
      child = (
        <Loading />
      );
    } else {
      child = this.props.albums.map(album => {
        return (
          <Album
            key={album.id}
            data={album}

            onClick={this.props.onClick}
            onRemove={this.props.removeAlbum}
            onAdd={this.props.addAlbum}
          />
        );
      });
    }

    return (
      <div>
        <header className="clearfix">
          <h3 className="pull-left">Upcoming Albums</h3>
          <div className="pull-right">
            <button className="btn btn-sm" onClick={this.props.refreshAlbums} disabled={this.props.loading}>
              <span className="glyphicon glyphicon-refresh"></span>
            </button>
          </div>
        </header>

        <article>
          <ScrollBar>
            {child}
          </ScrollBar>
        </article>
      </div>
    )
  }
}

const mapStateToProps = (state) => ({
  albums: state.albums.items,
  loading: state.albums.isFetching,
});

const mapDispatchToProps = (dispatch) => bindActionCreators({
  fetchAlbumsIfNeeded,
  invalidateAlbums,
  refreshAlbums,

  addAlbum,
  removeAlbum,
}, dispatch);

export default connect(mapStateToProps, mapDispatchToProps)(AlbumsIndex);
