import React from 'react';
import { connect } from 'react-redux';
import { fetchAlbumsIfNeeded, invalidateAlbums } from '../actions/MusicDownloadsActions';
import MusicDownloadServices from '../components/music_downloads/MusicDownloadServices';

class MusicDownloadsContainer extends React.Component {
  componentDidMount() {
    const { dispatch } = this.props;
    // dispatch(fetchAlbumsIfNeeded());
  }

  handleRefreshClick = (e) => {
    e.preventDefault();

    const { dispatch } = this.props;
    dispatch(invalidateAlbums());
    dispatch(fetchAlbumsIfNeeded());
  }

  render() {
    const { albums, isFetching, lastUpdated } = this.props;
    // const isEmpty = albums.length === 0;

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
