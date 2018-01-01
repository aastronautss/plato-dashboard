import React from 'react';
import axios from 'axios';
import ServiceFields from './ServiceFields';
import { musicDownloadServiceSchemas } from '../modules/serviceSchemas';

class NewMusicDownloadService extends React.Component {
  constructor (props) {
    super(props);

    this.schemas = musicDownloadServiceSchemas;
    this.availableServices = [null].concat(Object.entries(this.schemas).map(pair => pair[0]));

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);

    this.state = {
      app: null,
    };
  }

  selectedServiceSchema() {
    const service = this.state.app;
    return this.schemas[service] && this.schemas[service].properties;
  }

  formatData() {
    const serviceData = {
      app: this.state.app,
      label: this.state.label,

      data: this.formatCustomProperties()
    };

    return serviceData;
  }

  formatCustomProperties() {
    const serviceProperties = this.selectedServiceSchema();
    const customProperties = {};

    Object.entries(serviceProperties).forEach((pair) => {
      const key = pair[0];
      customProperties[key] = this.state[key];
    });

    return customProperties;
  }

  // Event handlers

  handleSubmit(e) {
    e.preventDefault();

    const data = this.formatData();

    axios.post('/api/music_downloads/services', { music_download_service: data })
      .then((response) => {
        this.props.onCreate(response.data);
      })
      .catch((error) => {
        console.error(error);
      });
  }

  handleChange(e) {
    const inputName = e.target.name;
    const inputValue = e.target.value;

    this.setState({ [inputName]: inputValue });
  }

  render() {
    const serviceOptionsForSelect = this.availableServices.map(service => {
      return <option key={service} value={service}>{service}</option>;
    });

    return (
      <div>
        <h3>Add a Service</h3>
        <form onSubmit={this.handleSubmit} onChange={this.handleChange}>
          <fieldset>
            <label>
              Service:
              <select name="app">{serviceOptionsForSelect}</select>
            </label>

            <label>
              Friendly name:
              <input type="text" name="label" onChange={this.handleChange} />
            </label>

            {
              this.selectedServiceSchema() &&
              <ServiceFields schema={this.selectedServiceSchema()} onChange={this.handleChange} />
            }
          </fieldset>

          <input type="submit" value="Submit" />
        </form>
      </div>
    );
  }
}

export default NewMusicDownloadService;
