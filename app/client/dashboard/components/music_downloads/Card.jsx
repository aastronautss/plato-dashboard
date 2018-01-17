import React from 'react';

import ScrollBar from 'react-perfect-scrollbar';

import AlbumCard from './AlbumCard';
import ArtistCard from './ArtistCard';

class Card extends React.Component {
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
      <div className="card-wrapper">
        <div className="card">
          <ScrollBar>
            <div className="card-content clearfix">
              <div className="pull-right">
                <a href="#" onClick={this.props.onClose}>
                  <span className="glyphicon glyphicon-remove text-muted"></span>
                </a>
              </div>

              {component}
            </div>
          </ScrollBar>
        </div>
      </div>
    );
  }
}

export default Card;
