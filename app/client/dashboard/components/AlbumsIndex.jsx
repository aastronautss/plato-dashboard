import React from 'react';
import axios from 'axios';
import Loading from './Loading';
import Album from './Album';

class AlbumsIndex extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      albums: []
    }
  }

  fetchAlbums() {
    axios.get(`api/music_downloads/services/${this.props.service.id}/albums.json`)
      .then(response => {
        this.setState({ albums: response.data });
      });
  }

  componentDidMount() {
    this.fetchAlbums();
  }

  render() {
    let children;
    if (this.state.albums.length === 0) {
      children = <Loading />
    } else {
      children = this.state.albums.map(album => {
        return (
          <li key={album.id}>
            <Album data={album} />
          </li>
        );
      });
    }

    return (
      <div>
        <h3>Upcoming Albums</h3>
        <div>{children}</div>
      </div>
    )
  }
}

export default AlbumsIndex;
