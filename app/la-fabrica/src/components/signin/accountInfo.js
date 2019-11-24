import React, { Component } from 'react'
import "./accountInfo.css";

export class AccountInfo extends Component {

    constructor(props){
        super(props)
        this.state = {
          file: null
        }
        this.handleChange = this.handleChange.bind(this)
      }

    handleChange(event) {
        this.setState({
            file: URL.createObjectURL(event.target.files[0])
        })
    }
    
    continue = e => {
        e.preventDefault();
        this.props.nextStep();
    }

    back = e => {
        e.preventDefault();
        this.props.prevStep();
    }
    
    render(){
        const { email1, email2, phoneNumber, password, photo, handleChange } = this.props;
        return(
            <div className = "account-info-page">
                <form>
                    <h1>Paso 3 de 3</h1>
                    <h2>Información de la cuenta</h2>
                    <label> 
                        Correo electrónico (principal) 
                        &emsp;&emsp;
                        Correo electrónico (secundario)
                    </label>
                    <input 
                        type="email"
                        name="email1"
                        value={email1}
                        onChange={handleChange('email1')}
                    />
                    <input 
                        type="email"
                        name="email2"
                        value={email2}
                        onChange={handleChange('email2')}
                    />
                    <label> 
                        Número telefónico 
                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;
                        Contraseña
                    </label>
                    <input 
                        type="tel"
                        name="phoneNumber"
                        value={phoneNumber}
                        onChange={handleChange('phoneNumber')}
                    />
                    <input 
                        type="password"
                        name="password"
                        value={password}
                        onChange={handleChange('password')}
                    />
                    <label>Imagen de perfil</label>
                    <input type="file" onChange={this.handleChange}/>
                    <img src={this.state.file}/>
                    <label></label>
                    <button className="Back" onClick={this.back}>
                        Anterior 
                    </button>
                    <button className="Next" onClick={this.continue}>
                        Finalizar
                    </button>
                </form>
            </div>
        );
    }
}

export default AccountInfo