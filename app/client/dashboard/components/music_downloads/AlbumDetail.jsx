import React from 'react';

import AlbumControls from './AlbumControls';

import msToDurationString from '../../modules/msToDurationString';

class AlbumDetail extends React.Component {
  render() {
    const album = this.props.album;
    const sortedTracks = album.tracks.sort((trackA, trackB) => trackA.number - trackB.number);
    const tracks = sortedTracks.map((track) => {
      return (
        <div className="card-list-item clearfix" key={track.id}>
          <div className="pull-left">
            <span className="text-muted card-list-item-prefix">{track.number}</span>
            <span>{track.title}</span>
          </div>

          <div className="pull-right">
            <span className="text-muted">
              {
                (track.duration > 0) &&
                msToDurationString(parseInt(track.duration))
              }
            </span>
          </div>
        </div>
      );
    });

    return (
      <div>
        <div className="card-header">
          <h2>{album.title}</h2>
          <span className="subtitle text-muted">{album.artist.name}</span>
        </div>

        <div className="text-center">
          <small className="text-muted">
            {album.type} {album.status && `// ${album.status}`}
          </small>
        </div>

        <div className="text-center">
          <AlbumControls album={album} onRemove={this.props.onRemove} onAdd={this.props.onAdd} />
        </div>

        <div className="card-list">
          <header>
            <h3>Tracks</h3>
          </header>

          <article>{tracks}</article>
        </div>
      </div>
    );
  }
}

export default AlbumDetail;
