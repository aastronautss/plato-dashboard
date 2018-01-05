import React from 'react';

import AlbumControls from './AlbumControls';

import msToDurationString from '../../modules/msToDurationString';

class AlbumDetail extends React.Component {
  render() {
    const album = this.props.album;
    const sortedTracks = album.tracks.sort((trackA, trackB) => trackA.number - trackB.number);
    const tracks = sortedTracks.map((track) => {
      return (
        <li key={track.id}>
          <span>{track.number}</span>
          <span>{track.title}</span>
          <span>{msToDurationString(parseInt(track.duration))}</span>
        </li>
      );
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
