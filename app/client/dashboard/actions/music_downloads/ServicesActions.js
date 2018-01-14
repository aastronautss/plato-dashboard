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
};
