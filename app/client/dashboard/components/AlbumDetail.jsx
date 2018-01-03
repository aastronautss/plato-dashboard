import React from 'react';
import AlbumControls from './AlbumControls';

class AlbumDetail extends React.Component {
  render() {
    const album = this.props.album;
    const tracks = album.tracks.map((track) => {
      return <li key={track.id}>{track.title}</li>;
    });

    return (
      <div>
        <h3>{album.title}</h3>
        <div>{album.type}</div>
        <div>{album.status}</div>
        <AlbumControls album={album} onRemove={this.props.onRemove} onAdd={this.props.onAdd} />

        <div>
          <h4>Tracks</h4>
          <ul>{tracks}</ul>
        </div>
      </div>
    );
  }
}

export default AlbumDetail;
