import React from "react";
import { Form, Message } from "semantic-ui-react";

const LoginForm = (props) => {
    const getForm = () => {
        if (props.formState.formStatus === "register") {
            return (
                <>
                    <h2>Register</h2>
                    <Form.Group widths="equal" inline>
                        <Form.Input
                            label="Name"
                            type="text"
                            placeholder="Name"
                            value={props.formState.name}
                            onChange={props.handleChange}
                            name="name"
                        />
                    </Form.Group>
                </>
            );
        } else {
            return <h2>Login</h2>;
        }
    };

    return (
        <Form onSubmit={props.handleSubmit} error={props.errorState}>
            {getForm()}
            <Form.Group widths="equal" inline>
                <Form.Input
                    label="Email"
                    type="email"
                    placeholder="Email"
                    value={props.formState.email}
                    onChange={props.handleChange}
                    name="email"
                />
            </Form.Group>
            <Form.Group widths="equal" inline>
                <Form.Input
                    label="Password"
                    type="password"
                    placeholder="Password"
                    value={props.formState.email}
                    onChange={props.handleChange}
                    name="password"
                />
            </Form.Group>
            <Form.Button>Submit</Form.Button>
            <Message
                error
                header="Action Forbidden"
                content={props.errorText}
            />
        </Form>
    );
};

export default LoginForm;
