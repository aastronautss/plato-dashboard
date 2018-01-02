import React from 'react';

class AlbumControls extends React.Component {
  render() {
    const album = this.props.album;
    let action;

    if (album.status === 'Wanted') {
      action = <button onClick={(e) => this.props.onRemove(this.props.album, e)}>Remove</button>
    } else {
      action = <button onClick={(e) => this.props.onAdd(this.props.album, e)}>Add</button>
    }

    return (
      <div>{action}</div>
    );
  }
}

export default AlbumControls
