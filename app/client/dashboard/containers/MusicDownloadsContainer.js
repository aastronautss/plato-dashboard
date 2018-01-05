const stores = '../stores/music_downloads'

import { Container } from 'flux/utils'
import MusicDownloadServices from '../components/music_downloads/MusicDownloadServices';
import MusicDownloadsActions from '../actions/MusicDownloadsActions';

const getStores = () => {
  return [
  ];
}

const getState = () => {
  return {
  };
}

export default Container.createFunctional(MusicDownloadServices, getStores, getState);
