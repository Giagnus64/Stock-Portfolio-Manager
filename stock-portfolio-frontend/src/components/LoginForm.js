import React, { Component } from 'react';
import { Form, Button } from "semantic-ui-react";

class LoginForm extends Component  {
    
    state = {
        email: '',
        password: '',
        name: '',
        formStatus:'login',
    }

    handleChange = (e) => {
        this.setState({
            [e.target.name]: e.target.value
        })
    }

    changeForm = (e) => {
        if(e.target.innerText === "Register"){
            this.setState({
                formStatus: "register"
            })
        }
        else{
            this.setState({
                formStatus: "login"
            })
        }
    }

    handleSubmit = () => {
        if(this.state.formStatus ==='register'){
            this.props.createUser(this.state)
        } else{
            this.props.loginUser(this.state)
        }
    }

    getForm = () => {
        if (this.state.formStatus === "register") {
            return (
                <>
                    <h2>Register</h2>
                    <Form.Group widths="equal" inline>
                        <Form.Input
                            label="Name"
                            type="text"
                            placeholder="Name"
                            value={this.state.name}
                            onChange={this.handleChange}
                            name="name"
                        />
                    </Form.Group>
                </>
            );
        } else {
            return <h2>Login</h2>;
        }
    };

    getButtons = () => {
        if(this.state.formStatus === 'login'){
            return ( 
                <>
                <Button onClick={this.handleSubmit}>Submit</Button>
                <Button onClick={this.changeForm}>Register</Button>
                </>
            )
        } else{
            return(
                <>
                <Button onClick={this.handleSubmit}>Submit</Button>
                <Button onClick={this.changeForm}>Login</Button>
                </>
            )

        }
    }

    
    render(){

        return (
            <Form>
                {this.getForm()}
                <Form.Group widths="equal" inline>
                    <Form.Input
                        label="Email"
                        type="email"
                        placeholder="Email"
                        value={this.state.email}
                        onChange={this.handleChange}
                        name="email"
                    />
                </Form.Group>
                <Form.Group widths="equal" inline>
                    <Form.Input
                        label="Password"
                        type="password"
                        placeholder="Password"
                        value={this.state.password}
                        onChange={this.handleChange}
                        name="password"
                    />
                </Form.Group>
                {this.getButtons()}
            </Form>
        );
    };
}

export default LoginForm;
