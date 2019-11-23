import React, { Component } from 'react'
import "./personalInfo.css";

export class PersonalInfo extends Component {
    
    continue = e => {
        e.preventDefault();
        this.props.nextStep();
    }
    
    render(){
        const { firstName, lastName1, lastName2, gender, birthday, height, weight, country, city, handleChange } = this.props;
        return(
            <div className = "personal-info-page">
                <form>
                    <h1>Paso 1 de 3</h1>
                    <h2>Información Personal</h2>
                    <label>Nombre</label>
                    <input 
                        type="text"
                        name="firstName"
                        value={firstName}
                        onChange={handleChange('firstName')}
                    />
                    <label>
                        Primer apellido 
                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;
                        Segundo apellido
                    </label>
                    <input 
                        type="text"
                        name="lastName1"
                        value={lastName1}
                        onChange={handleChange('lastName1')}
                    />
                    <input 
                        type="text"
                        name="lastName2"
                        value={lastName2}
                        onChange={handleChange('lastName2')}
                    />
                    <label>
                        Género 
                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
                        Fecha de nacimiento
                    </label>
                    <select name="gender" onChange={handleChange('gender')}>
                        <option value = {gender} selected >Masculino</option>
                        <option value = {gender} >Femenino</option>
                    </select>
                    <input
                        type="date"
                        name="birthday"
                        value={birthday}
                        onChange={handleChange('birthday')}
                    />
                    <label>
                        Altura (cm) 
                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;
                        Peso (Kg)
                    </label>
                    <input 
                        type="number"
                        name="height"
                        min="60" 
                        max="180" 
                        step="1"
                        value={height}
                        onChange={handleChange('height')}
                    />
                    <input 
                        type="number"
                        name="weight"
                        min="10" 
                        max="300" 
                        step="1"
                        value={weight}
                        onChange={handleChange('weight')}
                    />
                    <label>
                        País
                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;           
                        Ciudad
                    </label>
                    <select name="country" onChange={handleChange('country')}>
                        <option value = {country} selected>Costa Rica</option>
                    </select>
                    <select name="city" onChange={handleChange('city')}>
                        <option value = {city} selected>San José</option>
                        <option value = {city}>Alajuela</option>
                        <option value = {city}>Cartago</option>
                        <option value = {city}>Heredia</option>
                        <option value = {city}>Puntarenas</option>
                        <option value = {city}>Guanacaste</option>
                        <option value = {city}>Limón</option>   
                    </select>
                    <label></label>
                    <button className="Next" onClick={this.continue}>
                        Siguiente
                    </button>
                </form>
            </div>
        );
    }
}

export default PersonalInfo