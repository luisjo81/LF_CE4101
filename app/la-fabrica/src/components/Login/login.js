import React, { Component } from 'react';
import LoginAux from './loginAux';

import { BrowserRouter, Route, Switch, Redirect } from "react-router-dom";

import AdminLayout from "layouts/Admin.jsx";

export class UserForm extends Component {
    state = {
        step: 1,
        email: '',
        password: ''
    }

    //Proceed to next step
    nextStep = () => {
        const { step } = this.state;
        this.setState({
            step: step + 1
        });
    } 

    //Handle fields change
    handleChange = input => e => {
        this.setState({[input]: e.target.value});
    }

    showStep = () => {
        const { 
            step, email, password
        } = this.state;

        if(step === 1)
            return (<LoginAux 
                nextStep = {this.nextStep} 
                handleChange = {this.handleChange} 
                email = {email} 
                password = {password}
            />);
        if(step === 2)
            return (
                <BrowserRouter>
                    <Switch>
                    <Route path="/admin" render={props => <AdminLayout {...props} />} />
                    <Redirect from="/" to="/admin/dashboard" />
                    </Switch>
                </BrowserRouter>
            );
    }

    render() {
        const { step } = this.state;
        return(
            <>
                {this.showStep()}
            </>
        );
    }
}

export default UserForm