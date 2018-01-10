import { combineReducers } from 'redux';
import albums from './music_downloads/albumsReducer';

const rootReducer = combineReducers({
  albums,
});

export default rootReducer;
