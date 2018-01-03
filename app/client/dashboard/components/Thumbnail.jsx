import React from 'react';

class Thumbnail extends React.Component {
  render() {
    return <img src={this.props.src} />;
  }
}

export default Thumbnail;
