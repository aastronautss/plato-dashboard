import {
  REQUEST_ARTISTS, RECEIVE_ARTISTS, INVALIDATE_ARTISTS,
  REQUEST_SEARCH_ARTIST, RECEIVE_SEARCH_ARTIST,
  UPDATE_ARTIST,
  REQUEST_ADD_ARTIST, RECEIVE_ADD_ARTIST,
  REQUEST_REMOVE_ARTIST, RECEIVE_REMOVE_ARTIST, CLEAR_SEARCH_ARTIST,
} from '../../actions/MusicDownloadsActions';

const updatedArtists = (state, id, props) => {
  const { items } = state;
  const clonedItems = items.slice(0);
  const artist = clonedItems.find((item) => item.id === id);

  if (artist) {
    Object.keys(props).forEach((key) => artist[key] = props[key]);
  }

  return clonedItems;
}

const initialState = {
  isFetching: false,
  didInvalidate: true,
  items: [],

  isSearching: false,
  searchResults: [],
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
    case REQUEST_SEARCH_ARTIST:
      return {
        ...state,
        isSearching: true,
      };
    case RECEIVE_SEARCH_ARTIST:
      return {
        ...state,
        isSearching: false,
        searchResults: action.results,
      };
    case CLEAR_SEARCH_ARTIST:
      return {
        ...state,
        searchResults: [],
      }
    case UPDATE_ARTIST:
      items = updatedArtists(state, action.id, action.props);

      return {
        ...state,
        items,
      };
    case REQUEST_ADD_ARTIST:
      items = updatedArtists(state, action.id, {});

      return {
        ...state,
        items,
      };
    case RECEIVE_ADD_ARTIST:
      items = updatedArtists(state, action.id, {});

      return {
        ...state,
        items,
      };
    case REQUEST_REMOVE_ARTIST:
      items = updatedArtists(state, action.id, {});

      return {
        ...state,
        items,
      };
    case RECEIVE_REMOVE_ARTIST:
      items = updatedArtists(state, action.id, {});

      return {
        ...state,
        items,
      };
    default:
      return state;
  }
}
