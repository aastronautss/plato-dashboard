import React from 'react';
import axios from 'axios';
import AlbumsIndex from './AlbumsIndex';
import ArtistSearch from './ArtistSearch';

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
        <ArtistSearch service={this.props.service} />

        <div>
          {
            this.props.service &&
            this.state.currentView
          }
        </div>
      </div>
    );
  }
}

export default MusicDownloadService;
