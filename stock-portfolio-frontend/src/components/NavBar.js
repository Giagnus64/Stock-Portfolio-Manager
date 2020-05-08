import React, {Component} from 'react';
import { Menu } from "semantic-ui-react";
import { NavLink } from 'react-router-dom';
import { connect } from 'react-redux';
import {logoutUser} from '../actions/loginActions';

class NavBar extends Component {

    handleClick = (e, logout = false) => {
        if(logout){
            this.props.logoutUser();
        }
    }

    navItems = () => {
        if(this.props.isLoggedIn){
          return (
              <>
            <Menu.Item className="header-welcome" id="header-username">{`Logged in as ${this.props.name}`}</Menu.Item>
            <NavLink to="/login"><Menu.Item name='Logout' onClick={(e) => this.handleClick(e, true)}/></NavLink></>
            )
            
        }
    }
    render(){
        return(
            <Menu inverted className="top" id="navbar">
            <Menu.Item header>Stock Portfolio Manager</Menu.Item>
            <NavLink to="/home"><Menu.Item name='Portfolio'/></NavLink>
            <NavLink to="/transactions"><Menu.Item name='Transactions'/></NavLink>
            
            {this.navItems()}
          </Menu>
        )

    }
}

const mapStateToProps = (state, props) => {
    return {name: state.name, isLoggedIn: state.isLoggedIn}
}

const mapDispatchToProps = (dispatch, props) => {
    return {
        logoutUser: () => dispatch(logoutUser)
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(NavBar);