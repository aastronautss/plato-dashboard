import React from 'react';
import axios from 'axios';

import BasicNav from '../shared/BasicNav';
import AlbumsIndex from './AlbumsIndex';
import ArtistsIndex from './ArtistsIndex';
import ArtistSearch from './ArtistSearch';
import Card from './Card';

class MusicDownloadService extends React.Component {
  constructor(props) {
    super(props);

    this.handleNavClick = this.handleNavClick.bind(this);
    this.handleCardClick = this.handleCardClick.bind(this);

    this.views = {
      albums: {
        title: 'Albums',
        component: <AlbumsIndex onClick={this.handleCardClick} />,
      },
      artists: {
        title: 'Artists',
        component: <ArtistsIndex service={this.props.service} onClick={this.handleCardClick} />
      },
    };

    this.state = {
      currentView: 'albums',
      currentCard: null,
    };
  }

  setStateFromLink(ele, stateProp) {
    const href = ele.getAttribute('href');
    const val = href.replace('#', '');

    this.setState({ [stateProp]: val })
  }

  handleNavClick(e) {
    e.preventDefault();
    this.setStateFromLink(e.target, 'currentView');
  }

  handleCardClick(e) {
    e.preventDefault();
    this.setStateFromLink(e.target, 'currentCard');
  }

  render() {
    const currentComponent = this.views[this.state.currentView].component;

    return (
      <div>
        {
          this.state.currentCard &&
          <Card path={this.state.currentCard} service={this.props.service} />
        }

        <ArtistSearch service={this.props.service} />
        <BasicNav views={this.views} onClick={this.handleNavClick} />

        <div className="widget-body">
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
