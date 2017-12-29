import React from 'react';
import AlbumsIndex from './AlbumsIndex';

class MusicDownloads extends React.Component {
  constructor(props) {
    super(props);
    this.state = { currentView: <AlbumsIndex /> };
  }

  render() {
    return (
      <div>
        {this.state.currentView}
      </div>
    );
  }
}

export default MusicDownloads;
