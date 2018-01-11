import React from 'react';

import AlbumControls from './AlbumControls';

class Album extends React.Component {
  render() {
    const album = this.props.data;
    const href = `#album/${album.id}`;

    return (
      <div className="list-album">
        <h4>
          <a href={href} onClick={this.props.onClick}>
            {album.title}
          </a>
        </h4>
        <div className="list-album-artist">{album.artist.name}</div>
        <div className="list-album-release-date">{album.release_date}</div>
        <AlbumControls
          album={album}
          onRemove={this.props.onRemove}
          onAdd={this.props.onAdd}
        />
      </div>
    );
  }
}

export default Album;
