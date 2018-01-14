import { REQUEST_SERVICES, RECEIVE_SERVICES, SET_CURRENT_SERVICE } from '../../actions/MusicDownloadsActions';

const initialState = {
  isFetching: false,
  items: [],
};

const findCurrentService = (services, id) => services.find((service) => service.id === id);

export default function(state = initialState, action) {
  const { type } = action;

  switch (type) {
    case REQUEST_SERVICES:
      return {
        ...state,
        isFetching: true,
      };
    case RECEIVE_SERVICES:
      return {
        ...state,
        isFetching: false,
        items: action.items,
      };
    case SET_CURRENT_SERVICE:
      const currentService = findCurrentService(state.items, action.id)

      return {
        ...state,
        currentService,
      };
    default:
      return state;
  }
}
