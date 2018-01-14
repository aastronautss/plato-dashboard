import React from 'react';
import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import logger from 'redux-logger';
import thunk from 'redux-thunk';

import rootReducer from '../reducers/rootReducer';
import MusicDownloadsContainer from '../containers/MusicDownloadsContainer';

const middleware = [logger, thunk];

const musicDownloadsStore = createStore(
  rootReducer,
  composeWithDevTools(applyMiddleware(...middleware)),
);

class ControlPanel extends React.Component {
  render() {
    return (
      <div id="control-panel">
        <Provider store={musicDownloadsStore}>
          <MusicDownloadsContainer />
        </Provider>
      </div>
    );
  }
}

export default ControlPanel;
