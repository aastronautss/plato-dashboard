import {
  REQUEST_ALBUMS, RECEIVE_ALBUMS, INVALIDATE_ALBUMS,
  UPDATE_ALBUM,
  REQUEST_ADD_ALBUM, RECEIVE_ADD_ALBUM,
  REQUEST_REMOVE_ALBUM, RECEIVE_REMOVE_ALBUM,
} from '../../actions/MusicDownloadsActions';

const updatedAlbums = (state, id, props) => {
  const { items } = state;
  const clonedItems = items.slice(0);
  const album = clonedItems.find((item) => item.id === id);

  Object.keys(props).forEach((key) => album[key] = props[key]);

  return clonedItems;
}

const initialState = {
  isFetching: false,
  didInvalidate: true,
  items: []
};

export default function(state = initialState, action) {
  const { type } = action;
  let items;

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
    case UPDATE_ALBUM:
      items = updatedAlbums(state, action.id, action.props);

      return {
        ...state,
        items,
      };
    case REQUEST_ADD_ALBUM:
      items = updatedAlbums(state, action.id, {});

      return {
        ...state,
        items,
      };
    case RECEIVE_ADD_ALBUM:
      items = updatedAlbums(state, action.id, {});

      return {
        ...state,
        items,
      };
    case REQUEST_REMOVE_ALBUM:
      items = updatedAlbums(state, action.id, {});

      return {
        ...state,
        items,
      };
    case RECEIVE_REMOVE_ALBUM:
      items = updatedAlbums(state, action.id, {});

      return {
        ...state,
        items,
      };
    default:
      return state;
  }
}
