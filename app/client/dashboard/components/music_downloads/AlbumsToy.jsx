import React from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { fetchAlbumsIfNeeded } from '../../actions/MusicDownloadsActions';

const AlbumsToy = ({ albums, fetchAlbumsIfNeeded }) => (
  <div>
    <button onClick={fetchAlbumsIfNeeded}>Fetch Albums</button>
  </div>
);

const mapStateToProps = (state) => ({
  albums: state.albums,
});

const mapDispatchToProps = (dispatch) => bindActionCreators({
  fetchAlbumsIfNeeded,
}, dispatch);

export default connect(mapStateToProps, mapDispatchToProps)(AlbumsToy);
