import React from 'react';
import axios from 'axios';
import Loading from './Loading';
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
        <tr>
          <td colSpan="4"><Loading /></td>
        </tr>
      );
    } else {
      children = this.state.albums.map(album => {
        return (
          <Album
            key={album.id}
            data={album}
            onRemove={this.handleRemove}
            onAdd={this.handleAdd}
          />
        );
      });
    }

    return (
      <div>
        <h3>Upcoming Albums</h3>

        <table>
          <thead>
            <tr>
              <th>Artist</th>
              <th>Album</th>
              <th>Release Date</th>
              <th></th>
            </tr>
          </thead>

          <tbody>
            {children}
          </tbody>
        </table>
      </div>
    )
  }
}

export default AlbumsIndex;
