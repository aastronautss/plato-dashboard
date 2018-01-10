import axios from 'axios';

export const REQUEST_ALBUMS = 'REQUEST_ALBUMS';
export const RECEIVE_ALBUMS = 'RECEIVE_ALBUMS';
export const INVALIDATE_ALBUMS = 'INVALIDATE_ALBUMS';

export const invalidateAlbums = () => ({
  type: INVALIDATE_ALBUMS,
});

export const requestAlbums = () => ({
  type: REQUEST_ALBUMS,
});

export const receiveAlbums = (json) => ({
  type: RECEIVE_ALBUMS,
  items: json.data,
  receivedAt: Date.now(),
});

const fetchAlbums = () => (dispatch) => {
  dispatch(requestAlbums());
  return axios.get(`api/music_downloads/services/${this.props.service.id}/albums.json`)
    .then((response) => response.data)
    .then((data) => dispatch(receiveAlbums(json)))
}

const shouldFetchAlbums = (state) => {
  const albums = state.albums;

  if (!albums) {
    return true;
  }
  if (albums.isFetching) {
    return false;
  }
  return albums.didInvalidate;
};

export const fetchAlbumsIfNeeded = () => (dispatch, getState) => {
  if (shouldFetchAlbums(getState())) {
    return dispatch(fetchAlbums());
  }
};
