import React, { Component } from 'react';
import Menu from "../../components/menu/menu";
import "./login.css";
import Logo from '../../assets/logo/logo_lafabrica.png';

const emailRegex = RegExp(
  /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
);

const formValid = ({ formErrors, ...rest }) => {
  let valid = true;

  // validate form errors being empty
  Object.values(formErrors).forEach(val => {
    val.length > 0 && (valid = false);
  });

  // validate the form was filled out
  Object.values(rest).forEach(val => {
    val === null && (valid = false);
  });

  return valid;
};

class LogIn extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      email: null,
      password: null,
      formErrors: {
        email: "",
        password: ""
      }
    };
  }

  handleSubmit = e => {
    e.preventDefault();

    if (formValid(this.state)) {
      console.log(`
        --SUBMITTING--
        Email: ${this.state.email}
        Password: ${this.state.password}
      `);
    } else {
      console.error("FORM INVALID - DISPLAY ERROR MESSAGE");
    }
  };

  handleChange = e => {
    e.preventDefault();
    const { name, value } = e.target;
    let formErrors = { ...this.state.formErrors };

    switch (name) {
      case "email":
        formErrors.email = emailRegex.test(value)
          ? ""
          : "Correo electrónico inválido";
        break;
      default:
        break;
    }

    this.setState({ formErrors, [name]: value }, () => console.log(this.state));
  };

  render() {
    const { formErrors } = this.state;

    if (this.state.isLoading) {
      return (
        <Menu dataUser={this.state.dataUser} />
      );
    }
    else if (this.state.isCreateAccount) {

    }
    
    else {
      return (
        <div className="wrapper">
        <div className="top-bar">
          <img src={Logo} width="150" height="120"></img>
          <label>by X-Sport</label>
        </div>
        <div className="form-wrapper">
          <h1>Iniciar Sesión</h1>
          <form onSubmit={this.handleSubmit} noValidate>
            <div className="email">
              <label htmlFor="email">Correo electrónico</label>
              <input
                className={formErrors.email.length > 0 ? "error" : null}
                placeholder="Ingrese su correo electrónico"
                type="email"
                name="email"
                noValidate
                onChange={this.handleChange}
              />
              {formErrors.email.length > 0 && (
                <span className="errorMessage">{formErrors.email}</span>
              )}
            </div>
            <div className="password">
              <label htmlFor="password">Contraseña</label>
              <input
                className={formErrors.password.length > 0 ? "error" : null}
                placeholder="Ingrese su contraseña"
                type="password"
                name="password"
                noValidate
                onChange={this.handleChange}
              />
              {formErrors.password.length > 0 && (
                <span className="errorMessage">{formErrors.password}</span>
              )}
            </div>
            <div className="logIn">
              <button type="submit">Ingresar</button>
              <small>¿No tiene cuenta? Regístrese aquí</small>
            </div>
          </form>
        </div>
      </div>
      );
    }
  }
}
export default LogIn;