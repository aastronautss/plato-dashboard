import React from 'react';
import axios from 'axios';
import BasicNav from './BasicNav';
import AlbumsIndex from './AlbumsIndex';
import ArtistsIndex from './ArtistsIndex';
import ArtistSearch from './ArtistSearch';

class MusicDownloadService extends React.Component {
  constructor(props) {
    super(props);

    this.views = {
      albums: { title: 'Albums', component: <AlbumsIndex service={this.props.service} /> },
      artists: { title: 'Artists', component: <ArtistsIndex service={this.props.service} /> },
    };

    this.handleClick = this.handleClick.bind(this);

    this.state = { currentView: 'albums' };
  }

  handleClick(e) {
    e.preventDefault();
    const href = e.target.getAttribute('href');
    const key = href.replace('#', '');

    this.setState({ currentView: key });
  }

  render() {
    const currentComponent = this.views[this.state.currentView].component;

    return (
      <div>
        <ArtistSearch service={this.props.service} />
        <BasicNav views={this.views} onClick={this.handleClick} />

        <div>
          {
            this.props.service &&
            currentComponent
          }
        </div>
      </div>
    );
  }
}

export default MusicDownloadService;
