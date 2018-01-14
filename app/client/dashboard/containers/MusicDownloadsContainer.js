import React from 'react';
import { connect } from 'react-redux';
import MusicDownloadServices from '../components/music_downloads/MusicDownloadServices';

class MusicDownloadsContainer extends React.Component {
  componentDidMount() {
    const { dispatch } = this.props;
  }

  render() {
    return (
      <div id="music-downloads" className="widget">
        <MusicDownloadServices />
      </div>
    );
  }
}

const mapStateToProps = (state) => {
  const { albums } = state;
  const {
    isFetching,
    lastUpdated,
    items,
  } = albums;

  return {
    items,
    isFetching,
    lastUpdated,
  };
};

export default connect(mapStateToProps)(MusicDownloadsContainer);
