import React from 'react';
import axios from 'axios';
import MusicDownloadService from './MusicDownloadService';

class MusicDownloadServices extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      services: [],
      currentService: null,
    };
  }

  fetchServices() {
    axios.get('api/music_downloads/services')
      .then(response => {
        const services = response.data;

        this.setState({
          services,
          currentService: services[0],
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
    return (
      <div>
        <MusicDownloadService service={this.state.currentService} />
      </div>
    );
  }
}

export default MusicDownloadServices;
