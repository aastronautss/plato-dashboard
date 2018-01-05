import React from 'react';

import AlbumControls from './AlbumControls';

class Album extends React.Component {
  render() {
    const album = this.props.data;
    const href = `#album/${album.id}`;

    return (
      <tr>
        <td><a href={href} onClick={this.props.onClick}>{album.title}</a></td>
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
