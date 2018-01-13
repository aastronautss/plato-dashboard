import React from 'react';
import axios from 'axios';

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

  fetchAlbums() {
    axios.get(`api/music_downloads/services/${this.props.service.id}/albums.json`)
      .then((response) => {
        this.setState({ albums: response.data });
      });
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
    this.fetchAlbums();
  }

  render() {
    let children;
    if (this.state.albums.length === 0) {
      children = (
        <Loading />
      );
    } else {
      children = this.state.albums.map(album => {
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
        <header>
          <h3>Upcoming Albums</h3>
        </header>

        <article>
          {children}
        </article>
      </div>
    )
  }
}

export default AlbumsIndex;
