import { combineReducers } from 'redux';
import albums from './music_downloads/albumsReducer';
import services from './music_downloads/servicesReducer';

const rootReducer = combineReducers({
  albums,
  services,
});

export default rootReducer;
