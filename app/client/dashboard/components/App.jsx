import React from 'react';
import ControlPanel from './ControlPanel';

const App = (props) => (
  <div id="app">
    <header>
      <h1>Plato Dashboard</h1>
      <a href="/external_services">Services</a>
    </header>

    <ControlPanel />
  </div>
)

export default App;
