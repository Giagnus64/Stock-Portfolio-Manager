import React, {Component} from 'react';
import { Route, Switch, Redirect} from 'react-router-dom';
import { connect } from 'react-redux';
import { logoutUser } from './actions/loginActions';
import './App.scss';
import NavBar from './components/NavBar';
import LoginPage from './containers/LoginPage';

class App extends Component {
  render(){
    return (
      <div className="App">
        <NavBar/>
        <div className="page-container">
        <Switch>
          <Route
            path='/login'
            exact
            render= {
              () => localStorage.token ?
                <Redirect to='/home' /> :
                <LoginPage />}
          />
          home has portfolio and buy stock elements
          <Route
            path='/home'
            exact
            render={() => localStorage.token ? <></> : <Redirect to='login'/>}
          />
          {/* <Route
           transactions has list of transactions
            path='/transactions'

            exact
            render={() => localStorage.token ?
              <RecipePage openRecipeModal={this.openRecipeModal}  /> : <Redirect to='/login' />}
          /> */}
          <Route
            exact
            path='/'
            render={() => localStorage.token ?
              <Redirect to="/home" /> :
              <Redirect to='/login' />}
          />

        </Switch>
        </div>
      </div>
    );

  }
}
const mapStateToProps = (state, props) => {

    return { token:state.token, user_id: state.user_id, name: state.username, email:state.email }
  }
  const mapDispatchToProps = (dispatch, props) => {
    return {
      logoutUser: () => dispatch(logoutUser),
    }
  }
  
export default connect(mapStateToProps, mapDispatchToProps)(App);

