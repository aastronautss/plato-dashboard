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
