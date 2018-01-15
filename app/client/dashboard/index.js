"use strict";

import React from 'react';
import ReactDOM from 'react-dom';

import 'bootstrap/dist/css/bootstrap';
import 'react-perfect-scrollbar/dist/css/styles.css';
import './styles/dashboard';

import App from './components/App';

const dashboard = document.getElementById('dashboard');
ReactDOM.render(<App />, dashboard);
