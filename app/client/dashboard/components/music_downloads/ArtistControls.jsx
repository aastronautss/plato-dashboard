import React from 'react';

class ArtistControls extends React.Component {
  render() {
    const artist = this.props.artist;

    let buttons;
    if(artist.status === 'Active') {
      buttons = (
        <div>
          <button onClick={this.props.onPause}>Pause</button>
          <button onClick={this.props.onRemove}>Remove</button>
        </div>
      );
    } else if (artist.status === 'Paused') {
      buttons = (
        <div>
          <button onClick={this.props.onUnpause}>Unpause</button>
          <button onClick={this.props.onRemove}>Remove</button>
        </div>
      );
    } else {
      buttons = <div><button onClick={this.props.onAdd}>Add</button></div>;
    }

    return buttons;
  }
}

export default ArtistControls;
