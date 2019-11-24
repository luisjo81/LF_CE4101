import React, { Component } from 'react';
import PersonalInfo from './personalInfo';
import AccountInfo from './accountInfo';
import SportInfo from './sportInfo';

export class UserForm extends Component {
    state = {
        step: 1,

        //Step 1: Personal Information
        firstName: '',
        lastName1: '',
        lastName2: '',
        gender: '',
        birthday: '',
        height: '',
        weight: '',
        country: '',
        city: '',

        //Step 2: Sport Information
        university: '',
        studentID: '',
        sport: '',
        position1: '',
        position2: '',
        
        //Step 3: Account Information
        email1: '',
        email2: '',
        phoneNumber: '',
        password: '',
        photo: ''
    }

    //Proceed to next step
    nextStep = () => {
        const { step } = this.state;
        this.setState({
            step: step + 1
        });
    } 

    //Go back to previous step
    prevStep = () => {
        const { step } = this.state;
        this.setState({
            step: step - 1
        });
    } 

    //Handle fields change
    handleChange = input => e => {
        this.setState({[input]: e.target.value});
    }

    showStep = () => {
        const { 
            step, 
            firstName, lastName1, lastName2, gender, birthday, height, weight, country, city,
            university, studentID, sport, position1, position2,
            email1, email2, phoneNumber, password, photo
        } = this.state;

        if(step === 1)
            return (<PersonalInfo 
                nextStep = {this.nextStep} 
                handleChange = {this.handleChange} 
                firstName = {firstName} 
                lastName1 = {lastName1}
                lastName2 = {lastName2}
                gender = {gender}
                birthday = {birthday}
                height = {height}
                weight = {weight}
                country = {country}
                city = {city}
            />);
        if(step === 2)
            return (<SportInfo 
                nextStep = {this.nextStep} 
                prevStep = {this.prevStep}
                handleChange = {this.handleChange} 
                university = {university}
                studentID = {studentID}
                sport = {sport}
                position1 = {position1}
                position2 = {position2}
            />);
        if(step === 3)
            return (<AccountInfo 
                nextStep = {this.nextStep} 
                prevStep = {this.prevStep}
                handleChange = {this.handleChange} 
                email1 = {email1}
                email2 = {email2}
                phoneNumber = {phoneNumber}
                password = {password}
                photo = {photo}
            />);
        if(step === 4)
        return (
            <h1>Completado</h1>
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