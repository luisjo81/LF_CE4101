import React, { Component } from 'react'
import "./sportInfo.css";

export class SportInfo extends Component {
    
    continue = e => {
        e.preventDefault();
        this.props.nextStep();
    }

    back = e => {
        e.preventDefault();
        this.props.prevStep();
    }
    
    render(){
        const { university, studentID, sport, position1, position2,  handleChange } = this.props;
        return(
            <div className = "sport-info-page">
                <form>
                    <h1>Paso 2 de 3</h1>
                    <h2>Información Deportiva</h2>
                    <label>Universidad</label>
                    <select name="university" onChange={handleChange('university')}>
                        <option value = {university} selected >Instituto Tecnológico de Costa Rica</option>
                    </select>
                    <label> 
                        Carné
                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;
                        Disciplina deportiva
                    </label>
                    <input 
                        type="number"
                        name="studentID"
                        value={studentID}
                        onChange={handleChange('studentID')}
                    />
                    <select name="sport" onChange={handleChange('sport')}>
                        <option value = {sport} selected >Fútbol</option>
                    </select>
                    <label>
                        Posición principal 
                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;
                        Posición secundaria
                    </label>
                    <select name="position1" onChange={handleChange('position1')}>
                        <option value = {position1} selected >Portero</option>
                        <option value = {position1} >Defensa</option>
                        <option value = {position1} >Volante</option>
                        <option value = {position1} >Delantero</option>
                    </select>
                    <select name="position2" onChange={handleChange('position2')}>
                        <option value = {position1} >Portero</option>
                        <option value = {position1} selected >Defensa</option>
                        <option value = {position1} >Volante</option>
                        <option value = {position1} >Delantero</option>
                    </select>
                    <label></label>
                    <button className="Back" onClick={this.back}>
                        Anterior 
                    </button>
                    <button className="Next" onClick={this.continue}>
                        Siguiente
                    </button>
                </form>
            </div>
        );
    }
}

export default SportInfo