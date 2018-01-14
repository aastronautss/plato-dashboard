import axios from 'axios';

export const REQUEST_ALBUMS = 'REQUEST_ALBUMS';
export const RECEIVE_ALBUMS = 'RECEIVE_ALBUMS';
export const INVALIDATE_ALBUMS = 'INVALIDATE_ALBUMS';

export const requestAlbums = () => ({
  type: REQUEST_ALBUMS,
});

export const receiveAlbums = (json, serviceId) => ({
  type: RECEIVE_ALBUMS,
  serviceId,
  items: json,
  receivedAt: Date.now(),
});

export const invalidateAlbums = () => ({
  type: INVALIDATE_ALBUMS,
});

export const refreshAlbums = () => (dispatch) => {
  dispatch(invalidateAlbums());
  return dispatch(fetchAlbumsIfNeeded());
}

const fetchAlbums = () => (dispatch, getState) => {
  const state = getState();
  const serviceId = state.services.currentService.id;

  dispatch(requestAlbums());
  return axios.get(`api/music_downloads/services/${serviceId}/albums.json`)
    .then((response) => response.data)
    .then((data) => dispatch(receiveAlbums(data, serviceId)));
}

const shouldFetchAlbums = (state) => {
  const albums = state.albums;
  const services = state.services;

  if (!albums.items) {
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
