import React from 'react';
import axios from 'axios';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { fetchServices } from '../../actions/MusicDownloadsActions';

import Loading from '../shared/Loading';
import NewMusicDownloadService from './NewMusicDownloadService';
import MusicDownloadService from './MusicDownloadService';

class MusicDownloadServices extends React.Component {
  constructor(props) {
    super(props);

    this.handleCreate = this.handleCreate.bind(this);
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
    this.props.fetchServices();
  }

  render() {
    let view;

    if (this.props.loading || !this.props.currentService || this.props.services.length < 1) {
      view = <Loading />;
    } else if (this.props.currentService.id === -1) {
      view = <NewMusicDownloadService onCreate={this.handleCreate}/>;
    } else {
      view = <MusicDownloadService service={this.props.currentService} />;
    }

    return (
      <div>
        <h2>Music Downloads</h2>
        {view}
      </div>
    );
  }
}

const mapStateToProps = (state) => ({
  services: state.services.items,
  loading: state.services.isFetching,
  currentService: state.services.currentService,
});

const mapDispatchToProps = (dispatch) => bindActionCreators({
  fetchServices,
}, dispatch);

export default connect(mapStateToProps, mapDispatchToProps)(MusicDownloadServices);
