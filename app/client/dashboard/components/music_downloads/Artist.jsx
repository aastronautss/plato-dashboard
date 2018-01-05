import React from 'react';

import Thumbnail from '../shared/Thumbnail';
import ArtistControls from './ArtistControls';

class Artist extends React.Component {
  render() {
    return(
      <li>
        <span><Thumbnail src={this.props.data.image_thumbnail_url} /></span>
        <span>{this.props.data.name}</span>
        <span>{this.props.data.status}</span>
        <ArtistControls
          artist={this.props.data}

          onAdd={() => this.props.onAdd(this.props.data)}
          onRemove={() => this.props.onRemove(this.props.data)}
          onPause={() => this.props.onPause(this.props.data)}
          onUnpause={() => this.props.onUnpause(this.props.data)}
        />
      </li>
    );
  }
}

export default Artist;
