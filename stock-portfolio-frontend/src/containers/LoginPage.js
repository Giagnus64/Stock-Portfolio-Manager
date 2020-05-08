import React, {Component} from "react";
import { connect } from 'react-redux';
import {Card} from 'semantic-ui-react';
import LoginForm from '../components/LoginForm';
import {loginUser, logoutUser, createUser } from '../actions/loginActions';


class LoginPage extends Component{

    render() {
        return (
            <div className="loginContainer">
                <Card className="login-card">
                <LoginForm loginUser={this.props.loginUser} createUser={this.props.createUser} toggleNav={this.props.toggleNav}/>
                </Card>
            </div>
        )
    }
}

const mapStateToProps = (state, props) => {
    return {}
}
const mapDispatchToProps = (dispatch, props) => {
    return {
        loginUser: (creds) => dispatch(loginUser(creds)),
        logoutUser: () => dispatch(logoutUser),
        createUser: (creds) => dispatch(createUser(creds))
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(LoginPage);