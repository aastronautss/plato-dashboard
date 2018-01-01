import React from 'react';
import axios from 'axios';

class AlbumsIndex extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      albums: []
    }
  }

  fetchAlbums() {
    axios.get(`api/music_downloads/services/${this.props.service.id}/albums.json`);
  }

  componentDidMount() {
    this.fetchAlbums();
  }

  render() {
    return (
      <div>hello world</div>
    )
  }
}

export default AlbumsIndex;
