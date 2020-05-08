import React from 'react';
import { Menu } from "semantic-ui-react";
import { NavLink } from 'react-router-dom';

const NavBar = () => {

    const navItems = () => {
        // if(this.state.token){
        //   return (<>
        //     <NavLink to="/profile"><Menu.Item name='Profile' /></NavLink>
        //     <NavLink to="/home"><Menu.Item name='Relationships'/></NavLink>
        //     <NavLink to="/dates"><Menu.Item name='Dates'/></NavLink>
        //     <Menu.Item name='Logout' onClick={this.logout}/>
        //     <Menu.Item className="header-welcome" id="header-username">{`Logged in as ${this.state.currentUser.first_name + " " + this.state.currentUser.last_name}`}</Menu.Item>
        //     </>)
        // }
      }
    return(
        <Menu inverted className="top" id="navbar">
        <Menu.Item header>Stock Portfolio Manager</Menu.Item>
        {navItems()}
      </Menu>
    )
}
export default NavBar