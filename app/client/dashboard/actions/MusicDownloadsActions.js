import axios from 'axios';

export const REQUEST_SERVICES = 'REQUEST_SERVICES';
export const RECEIVE_SERVICES = 'RECEIVE_SERVICES';
export const SET_CURRENT_SERVICE = 'SET_CURRENT_SERVICE';

export const requestServices = () => ({
  type: REQUEST_SERVICES,
});

export const receiveServices = (json) => ({
  type: RECEIVE_SERVICES,
  items: json,
});

export const setCurrentService = (id) => ({
    type: SET_CURRENT_SERVICE,
    id
});

const shouldSetCurrentService = (state) => {
  const services = state.services;

  if (!services.items || services.items.length === 0 || services.isFetching) {
    return false;
  }

  return true
};

export const fetchServices = () => (dispatch, getState) => {
  dispatch(requestServices());
  return axios.get('api/music_downloads/services.json')
    .then((response) => response.data)
    .then((data) => {
      dispatch(receiveServices(data))
      return data;
    })
    .then((data) => {
      const state = getState();

      if (shouldSetCurrentService(state)) {
        return dispatch(setCurrentService(data[0].id));
      }
    });
}

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
  items: json,
  receivedAt: Date.now(),
});

const fetchAlbums = () => (dispatch, state) => {
  dispatch(requestAlbums());
  return axios.get(`api/music_downloads/services/${this.props.service.id}/albums.json`)
    .then((response) => response.data)
    .then((data) => dispatch(receiveAlbums(data)));
}

const shouldFetchAlbums = (state) => {
  const albums = state.albums;

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
    return dispatch(fetchAlbums(), getState);
  }
};
