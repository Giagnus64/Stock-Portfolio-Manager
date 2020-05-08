import React, {Component} from "react";
import {Card, Menu} from 'semantic-ui-react';
import LoginForm from '../components/LoginForm';


class LoginContainer extends Component{

    state = {
        name: '',
        email: '',
        password: '',
        formStatus: 'register'
    }

    handleChange = (event) => {
        this.setState({
            [event.target.name]: event.target.value
        })
    }
    handleSubmit = (event) => {
        event.preventDefault()
        this.props.loginUser(this.state)
        this.setState({
          email:'',
          name: '',
          password: ''
        })
    }

    changeForm = (event) => {
        //this.props.removeFormError();
        this.setState({
            formStatus: event.target.dataset.name
        })
    }

    render() {
        return (
            <div className="loginContainer">
                <Menu tabular className="login-menu">
                    <Menu.Item data-name="login" active={this.state.formStatus === "login"} className="menu-item" onClick={this.changeForm}>
                        Login
                    </Menu.Item>
                    <Menu.Item data-name="register" active={this.state.formStatus === 'register'} className="menu-item" onClick={this.changeForm}>
                        Register
                    </Menu.Item>
                </Menu>
                <Card className="login-card">
                <LoginForm formState={this.state} handleChange={this.handleChange} handleSubmit={this.handleSubmit}/>
                </Card>
            </div>
        )
    }
}
export default LoginContainer