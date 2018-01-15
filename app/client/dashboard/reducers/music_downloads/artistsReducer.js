import {
  REQUEST_ARTISTS, RECEIVE_ARTISTS, INVALIDATE_ARTISTS,
} from '../../actions/MusicDownloadsActions';

const initialState = {
  isFetching: false,
  didInvalidate: true,
  items: [],
};

export default function(state = initialState, action) {
  const { type } = action;

  switch (type) {
    case INVALIDATE_ARTISTS:
      return {
        ...state,
        didInvalidate: true,
      };
    case REQUEST_ARTISTS:
      return {
        ...state,
        isFetching: true,
        didInvalidate: false,
      };
    case RECEIVE_ARTISTS:
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
