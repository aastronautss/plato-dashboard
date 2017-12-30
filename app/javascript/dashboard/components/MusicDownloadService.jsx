import React from 'react';
import axios from 'axios';
import AlbumsIndex from './AlbumsIndex';

class MusicDownloadService extends React.Component {
  constructor(props) {
    super(props);

    this.views = [
      <AlbumsIndex service={this.props.service}/>,
    ];
    this.state = {
      currentView: this.views[0],
    };
  }

  render() {
    return (
      <div>
        {
          this.props.service &&
          this.state.currentView
        }
      </div>
    );
  }
}

export default MusicDownloadService;
