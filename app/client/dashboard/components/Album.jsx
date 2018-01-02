import React from 'react';
import AlbumControls from './AlbumControls';

class Album extends React.Component {
  render() {
    const album = this.props.data;

    return (
      <div>
        <div>
          {album.title} <span>{album.artist.name}</span>
        </div>

        <div>
          {album.release_date}
        </div>

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
