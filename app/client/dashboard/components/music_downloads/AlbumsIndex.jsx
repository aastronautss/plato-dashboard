import React from 'react';
import axios from 'axios';

import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { fetchAlbumsIfNeeded, invalidateAlbums, refreshAlbums } from '../../actions/MusicDownloadsActions';

import Loading from '../shared/Loading';
import Album from './Album';

class AlbumsIndex extends React.Component {
  constructor(props) {
    super(props);

    this.handleRemove = this.handleRemove.bind(this);
    this.handleAdd = this.handleAdd.bind(this);

    this.state = {
      albums: []
    }
  }

  updatedAlbumStatus(prevState, album, newStatus) {
    const albums = prevState.albums.slice(0);
    const idx = albums.findIndex(ele => ele.id === album.id);
    albums[idx].status = newStatus;

    return { albums: albums };
  }

  handleRemove(album) {
    axios.delete(`api/music_downloads/services/${this.props.service.id}/albums/registrations/${album.id}`)
      .then((response) => {
        this.setState((prevState, props) => this.updatedAlbumStatus(prevState, album, 'Skipped'));
      })
      .catch(error => {
        console.error(error);
      });
  }

  handleAdd(album) {
    const data = { registration: { id: album.id } };

    axios.post(`api/music_downloads/services/${this.props.service.id}/albums/registrations.json`, data)
      .then((response) => {
        this.setState((prevState, props) => this.updatedAlbumStatus(prevState, album, 'Wanted'));
      })
      .catch(error => {
        console.error(error);
      });
  }

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
            onRemove={this.handleRemove}
            onAdd={this.handleAdd}
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
          {child}
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
}, dispatch);

export default connect(mapStateToProps, mapDispatchToProps)(AlbumsIndex);
