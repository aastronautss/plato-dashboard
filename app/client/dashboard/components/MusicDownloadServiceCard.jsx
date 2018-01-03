import React from 'react';
import AlbumCard from './AlbumCard';
import ArtistCard from './ArtistCard';

class MusicDownloadServiceCard extends React.Component {
  getComponentForPath() {
    const parts = this.props.path.split('/');

    let component;
    if (parts[0] === 'album') {
      component = <AlbumCard id={parts[1]} service={this.props.service} />;
    } else if (parts[0] === 'artist') {
      component = <ArtistCard id={parts[1]} service={this.props.service} />;
    }

    return component;
  }

  render() {
    const component = this.getComponentForPath();

    return (
      <div>{component}</div>
    );
  }
}

export default MusicDownloadServiceCard;
