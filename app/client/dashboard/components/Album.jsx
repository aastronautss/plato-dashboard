import React from 'react';

class Album extends React.Component {
  render() {
    return (
      <div>{JSON.stringify(this.props.data)}</div>
    );
  }
}

export default Album;
