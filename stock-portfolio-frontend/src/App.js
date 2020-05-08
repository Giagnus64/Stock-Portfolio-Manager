import React, {Component} from 'react';
import {Route, Switch, Redirect} from 'react-router-dom';
import { connect } from 'react-redux';
import './App.scss';
import NavBar from './components/NavBar';
import LoginContainer from './containers/LoginContainer';

class App extends Component {
  render(){
    return (
      <div className="App">
        <NavBar/>
        <LoginContainer/>
      </div>
    );

  }
}

export default App;
