import React from 'react';
import axios from 'axios';
import Loading from './Loading';
import NewMusicDownloadService from './NewMusicDownloadService';
import MusicDownloadService from './MusicDownloadService';

class MusicDownloadServices extends React.Component {
  constructor(props) {
    super(props);

    this.newService = {
      id: -1,
      name: 'New',
    };

    this.state = {
      services: [this.newService],
      currentService: this.newService,

      loading: true,
    };
  }

  fetchServices() {
    axios.get('api/music_downloads/services')
      .then(response => {
        const services = response.data;

        this.setState({
          services: [this.newService].concat(services),
          currentService: (services[1] || this.newService),

          loading: false,
        });
      })
      .catch(error => {
        console.error(error);
      });
  }

  componentDidMount() {
    this.fetchServices();
  }

  render() {
    let view;

    if (this.state.loading) {
      view = <Loading />;
    } else if (this.state.currentService.id === -1) {
      view = <NewMusicDownloadService />;
    } else {
      view = <MusicDownloadService service={this.state.currentService} />;
    }

    return <div>{view}</div>;
  }
}

export default MusicDownloadServices;
