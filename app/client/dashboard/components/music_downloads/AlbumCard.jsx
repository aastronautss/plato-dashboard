import React from 'react';
import axios from 'axios';

import Loading from '../shared/Loading';
import AlbumDetail from './AlbumDetail';

class AlbumCard extends React.Component {
  constructor(props) {
    super(props);

    this.state = { album: null };
  }

  fetchAlbum(id) {
    const service_id = this.props.service.id

    axios.get(`/api/music_downloads/services/${service_id}/albums/${id}`)
      .then((response) => this.setState({ album: response.data }))
      .catch((error) => console.error(error));
  }

  componentDidMount() {
    this.fetchAlbum(this.props.id);
  }

  componentWillReceiveProps(nextProps) {
    this.fetchAlbum(nextProps.id);
  }

  // componentDidUpdate() {
  //   this.fetchAlbum();
  // }

  render() {
    let component;
    if (this.state.album) {
      component = <AlbumDetail album={this.state.album} />;
    } else {
      component = <Loading />;
    }

    return (
      <div>{component}</div>
    );
  }
}

export default AlbumCard;
