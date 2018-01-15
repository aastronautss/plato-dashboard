import { combineReducers } from 'redux';
import services from './music_downloads/servicesReducer';
import albums from './music_downloads/albumsReducer';
import artists from './music_downloads/artistsReducer';

const rootReducer = combineReducers({
  services,
  albums,
  artists,
});

export default rootReducer;
