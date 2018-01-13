import React from 'react';

import Thumbnail from '../shared/Thumbnail';
import ArtistControls from './ArtistControls';

class Artist extends React.Component {
  render() {
    return(
      <div className="list-item clearfix">
        <div className="list-item-body pull-left">
          <div className="list-item-thumbnail pull-left"><Thumbnail src={this.props.data.image_thumbnail_url} /></div>
          <h4>{this.props.data.name}</h4>
          <div><small className="text-muted">{this.props.data.status}</small></div>
        </div>


        <ArtistControls
          className="pull-right list-item-controls"

          artist={this.props.data}

          onAdd={() => this.props.onAdd(this.props.data)}
          onRemove={() => this.props.onRemove(this.props.data)}
          onPause={() => this.props.onPause(this.props.data)}
          onUnpause={() => this.props.onUnpause(this.props.data)}
        />
      </div>
    );
  }
}

export default Artist;
