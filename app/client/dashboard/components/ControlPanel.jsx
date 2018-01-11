import React from 'react';
import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
// import thunk from 'redux-thunk';
import { composeWithDevTools } from 'redux-devtools-extension';

import rootReducer from '../reducers/rootReducer';
import MusicDownloadsContainer from '../containers/MusicDownloadsContainer';

// const middleware = [thunk];

const musicDownloadsStore = createStore(
  rootReducer,
  // applyMiddleware(...middleware)
  composeWithDevTools()
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
