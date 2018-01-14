import React from 'react';

class AlbumControls extends React.Component {
  render() {
    const album = this.props.album;
    let action;

    if (album.status === 'Wanted') {
      action = (
        <button className="btn btn-xs" onClick={(e) => this.props.onRemove(this.props.album.id, e)}>
          Remove
        </button>
      );
    } else {
      action = (
        <button className="btn btn-xs" onClick={(e) => this.props.onAdd(this.props.album.id, e)}>
          Add
        </button>
      );
    }

    return (
      <div className={`${this.props.className} album-controls`}>
        {action}
      </div>
    );
  }
}

export default AlbumControls
