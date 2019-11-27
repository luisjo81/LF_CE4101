import React, { Component } from 'react'
import "./loginAux.css";

export class LoginAux extends Component {
    
    continue = e => {
        e.preventDefault();
        this.props.nextStep();
    }
    
    render(){
        const { email, password, handleChange } = this.props;
        return(
            <div className = "login-aux-page">
                <form>
                    <h1>Iniciar sesión</h1>
                    <label>Correo electrónico</label>
                    <input 
                        type="email"
                        name="email"
                        value={email}
                        onChange={handleChange('email')}
                    />
                    <label>Contraseña</label>
                    <input 
                        type="password"
                        name="password"
                        value={password}
                        onChange={handleChange('password')}
                    />
                    <label></label>
                    <button className="Next" onClick={this.continue}>
                        Ingresar
                    </button>
                </form>
            </div>
        );
    }
}

export default LoginAux