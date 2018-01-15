import axios from 'axios';

// Albums collection

export const REQUEST_ALBUMS = 'REQUEST_ALBUMS';
export const RECEIVE_ALBUMS = 'RECEIVE_ALBUMS';
export const INVALIDATE_ALBUMS = 'INVALIDATE_ALBUMS';

export const requestAlbums = () => ({
  type: REQUEST_ALBUMS,
});

export const receiveAlbums = (items, serviceId) => ({
  type: RECEIVE_ALBUMS,
  items,
  serviceId,
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

// Album models

export const UPDATE_ALBUM = 'UPDATE_ALBUM';
export const REQUEST_ADD_ALBUM = 'REQUEST_ADD_ALBUM';
export const RECEIVE_ADD_ALBUM = 'RECEIVE_ADD_ALBUM';
export const REQUEST_REMOVE_ALBUM = 'REQUEST_REMOVE_ALBUM';
export const RECEIVE_REMOVE_ALBUM = 'RECEIVE_REMOVE_ALBUM';

const shouldPerformActionOnAlbum = (id, state) => true;

const updateAlbum = (id, props, serviceId) => ({
  type: UPDATE_ALBUM,

  id,
  props,
  serviceId,
});

// Add album

const requestAddAlbum = (id, serviceId) => ({
  type: REQUEST_ADD_ALBUM,

  id,
  serviceId,
});

const receiveAddAlbum = (id, serviceId) => ({
  type: RECEIVE_ADD_ALBUM,

  id,
  serviceId,
});

const completeAddAlbum = (id, serviceId) => (dispatch) => {
  const props = { status: 'Wanted' };

  dispatch(updateAlbum(id, props, serviceId));
  return dispatch(receiveAddAlbum(id, serviceId));
};

const performAddAlbum = (id) => (dispatch, getState) => {
  const state = getState();
  const serviceId = state.services.currentService.id;
  const data = { registration: { id: id } };


  dispatch(requestAddAlbum(id, serviceId));
  return axios.post(`api/music_downloads/services/${serviceId}/albums/registrations.json`, data)
    .then((response) => response.data)
    .then((data) => dispatch(completeAddAlbum(id, serviceId, data)));
}

export const addAlbum = (id) => (dispatch, getState) => {
  if (shouldPerformActionOnAlbum(id, getState())) {
    return dispatch(performAddAlbum(id));
  }
};

// Remove album

const requestRemoveAlbum = (id, serviceId) => ({
  type: REQUEST_REMOVE_ALBUM,

  id,
  serviceId,
});

const receiveRemoveAlbum = (id, serviceId) => ({
  type: RECEIVE_REMOVE_ALBUM,

  id,
  serviceId,
});

const completeRemoveAlbum = (id, serviceId) => (dispatch) => {
  const props = { status: 'Skipped' };

  dispatch(updateAlbum(id, props, serviceId));
  return dispatch(receiveRemoveAlbum(id, serviceId));
};

const performRemoveAlbum = (id) => (dispatch, getState) => {
  const state = getState();
  const serviceId = state.services.currentService.id;

  dispatch(requestRemoveAlbum(id, serviceId));
  return axios.delete(`api/music_downloads/services/${serviceId}/albums/registrations/${id}.json`)
    .then((response) => response.data)
    .then((data) => dispatch(completeRemoveAlbum(id, serviceId, data)));
}

export const removeAlbum = (id) => (dispatch, getState) => {
  if (shouldPerformActionOnAlbum(id, getState())) {
    return dispatch(performRemoveAlbum(id));
  }
};
