import { REQUEST_ALBUMS, RECEIVE_ALBUMS, INVALIDATE_ALBUMS } from '../../actions/MusicDownloadsActions';

const initialState = {
  isFetching: false,
  didInvalidate: true,
  items: []
};

export default function(state = initialState, action) {
  const { type } = action;

  switch (type) {
    case INVALIDATE_ALBUMS:
      return {
        ...state,
        didInvalidate: true,
      };
    case REQUEST_ALBUMS:
      return {
        ...state,
        isFetching: true,
        didInvalidate: false,
      };
    case RECEIVE_ALBUMS:
      return {
        ...state,
        isFetching: false,
        didInvalidate: false,
        items: action.items,
        lastUpdated: action.receivedAt,
      };
    default:
      return state;
  }
}
