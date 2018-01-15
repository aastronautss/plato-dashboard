import axios from 'axios';

// Artists collection

export const REQUEST_ARTISTS = 'REQUEST_ARTISTS';
export const RECEIVE_ARTISTS = 'RECEIVE_ARTISTS';
export const INVALIDATE_ARTISTS = 'INVALIDATE_ARTISTS';

export const requestArtists = () => ({
  type: REQUEST_ARTISTS,
});

export const receiveArtists = (items, serviceId) => ({
  type: RECEIVE_ARTISTS,
  items,
  serviceId,
  receivedAt: Date.now(),
});

export const invalidateArtists = () => ({
  type: INVALIDATE_ARTISTS,
});

export const refreshArtists = () => (dispatch) => {
  dispatch(invalidateArtists());
  return dispatch(fetchArtistsIfNeeded());
}

const fetchArtists = () => (dispatch, getState) => {
  const state = getState();
  const serviceId = state.services.currentService.id;

  dispatch(requestArtists());
  return axios.get(`api/music_downloads/services/${serviceId}/artists/registrations.json`)
    .then((response) => response.data)
    .then((data) => dispatch(receiveArtists(data, serviceId)));
}

const shouldFetchArtists = (state) => {
  const artists = state.artists;
  const services = state.services;

  if (!artists.items) {
    return true;
  }
  if (artists.isFetching) {
    return false;
  }
  return artists.didInvalidate;
};

export const fetchArtistsIfNeeded = () => (dispatch, getState) => {
  if (shouldFetchArtists(getState())) {
    return dispatch(fetchArtists());
  }
};

// Artist model

export const UPDATE_ARTIST = 'UPDATE_ARTIST';
export const REQUEST_ADD_ARTIST = 'REQUEST_ADD_ARTIST';
export const RECEIVE_ADD_ARTIST = 'RECEIVE_ADD_ARTIST';
export const REQUEST_REMOVE_ARTIST = 'REQUEST_REMOVE_ARTIST';
export const RECEIVE_REMOVE_ARTIST = 'RECEIVE_REMOVE_ARTIST';

const shouldPerformActionOnArtist = (id, state) => true;

const updateArtist = (id, props, serviceId) => ({
  type: UPDATE_ARTIST,

  id,
  props,
  serviceId,
});

// Add artist

const requestAddArtist = (id, serviceId) => ({
  type: REQUEST_ADD_ARTIST,

  id,
  serviceId,
});

const receiveAddArtist = (id, serviceId) => ({
  type: RECEIVE_ADD_ARTIST,

  id,
  serviceId,
});

const completeAddArtist = (id, serviceId) => (dispatch) => {
  const props = { status: 'Active' };

  dispatch(updateArtist(id, props, serviceId));
  return dispatch(receiveAddArtist(id, serviceId));
};

const performAddArtist = (id) => (dispatch, getState) => {
  const state = getState();
  const serviceId = state.services.currentService.id;
  const data = { registration: { id: id } };


  dispatch(requestAddArtist(id, serviceId));
  return axios.post(`api/music_downloads/services/${serviceId}/artists/registrations.json`, data)
    .then((response) => response.data)
    .then((data) => dispatch(completeAddArtist(id, serviceId, data)));
}

export const addArtist = (id) => (dispatch, getState) => {
  if (shouldPerformActionOnArtist(id, getState())) {
    return dispatch(performAddArtist(id));
  }
};

// Remove artist

const requestRemoveArtist = (id, serviceId) => ({
  type: REQUEST_REMOVE_ARTIST,

  id,
  serviceId,
});

const receiveRemoveArtist = (id, serviceId) => ({
  type: RECEIVE_REMOVE_ARTIST,

  id,
  serviceId,
});

const completeRemoveArtist = (id, serviceId) => (dispatch) => {
  const props = { status: 'Inactive' };

  dispatch(updateArtist(id, props, serviceId));
  return dispatch(receiveRemoveArtist(id, serviceId));
};

const performRemoveArtist = (id) => (dispatch, getState) => {
  const state = getState();
  const serviceId = state.services.currentService.id;

  dispatch(requestRemoveArtist(id, serviceId));
  return axios.delete(`api/music_downloads/services/${serviceId}/artists/registrations/${id}.json`)
    .then((response) => response.data)
    .then((data) => dispatch(completeRemoveArtist(id, serviceId, data)));
}

export const removeArtist = (id) => (dispatch, getState) => {
  if (shouldPerformActionOnArtist(id, getState())) {
    return dispatch(performRemoveArtist(id));
  }
};
