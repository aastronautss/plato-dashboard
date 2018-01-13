import React from 'react';

import AlbumControls from './AlbumControls';

class Album extends React.Component {
  render() {
    const album = this.props.data;
    const href = `#album/${album.id}`;

    return (
      <div className="list-item clearfix">
        <div className="list-item-body pull-left">
          <h4>
            <a href={href} onClick={this.props.onClick}>
              {album.title}
            </a>
          </h4>
          <div className="list-item-info">
            {album.artist.name} <small className="text-muted">{album.release_date}</small>
          </div>
        </div>

        <AlbumControls
          className="pull-right"

          album={album}
          onRemove={this.props.onRemove}
          onAdd={this.props.onAdd}
        />
      </div>
    );
  }
}

export default Album;
