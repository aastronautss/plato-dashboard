import React from 'react';
import AlbumControls from './AlbumControls';

class Album extends React.Component {
  render() {
    const album = this.props.data;

    return (
      <tr>
        <td>{album.title}</td>
        <td>{album.artist.name}</td>
        <td>{album.release_date}</td>
        <td>
          <AlbumControls
            album={album}
            onRemove={this.props.onRemove}
            onAdd={this.props.onAdd}
          />
        </td>
      </tr>
    );
  }
}

export default Album;
