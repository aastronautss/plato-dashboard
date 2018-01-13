import React from 'react';

class ArtistControls extends React.Component {
  render() {
    const artist = this.props.artist;

    let buttons;
    if(artist.status === 'Active') {
      buttons = (
        <div className={this.props.className}>
          <button className="btn btn-xs" onClick={this.props.onPause}>Pause</button>
          <button className="btn btn-xs" onClick={this.props.onRemove}>Remove</button>
        </div>
      );
    } else if (artist.status === 'Paused') {
      buttons = (
        <div className={this.props.className}>
          <button className="btn btn-xs" onClick={this.props.onUnpause}>Unpause</button>
          <button className="btn btn-xs" onClick={this.props.onRemove}>Remove</button>
        </div>
      );
    } else {
      buttons = (
        <div className={this.props.className}>
          <button className="btn btn-xs" onClick={this.props.onAdd}>Add</button>
        </div>
      );
    }

    return (
      buttons
    );
  }
}

export default ArtistControls;
