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

    this.handleCreate = this.handleCreate.bind(this);

    this.state = {
      services: [this.newService],
      currentService: this.newService,

      loading: true,
    };
  }

  fetchServices() {
    axios.get('api/music_downloads/services.json')
      .then(response => {
        const services = response.data;

        this.setState({
          services: [this.newService].concat(services),
          currentService: (services[0] || this.newService),

          loading: false,
        });
      })
      .catch(error => {
        console.error(error);
      });
  }

  // Event Handlers

  handleCreate(createdService) {
    this.setState((prevState, props) => ({
      services: prevState.services.concat(createdService),
      currentService: createdService
    }));
  }

  // Lifecycle callbacks

  componentDidMount() {
    this.fetchServices();
  }

  render() {
    let view;

    if (this.state.loading) {
      view = <Loading />;
    } else if (this.state.currentService.id === -1) {
      view = <NewMusicDownloadService onCreate={this.handleCreate}/>;
    } else {
      view = <MusicDownloadService service={this.state.currentService} />;
    }

    return <div>{view}</div>;
  }
}

export default MusicDownloadServices;
