import React, { Component } from 'react'

export class Success extends Component {
    
    constructor(props){
        super(props);
        this.state = {
            items: [], 
            isLoaded: false
        }
    }

    componentDidMount() {
        fetch('https://lafabricarestapi.azurewebsites.net/getinfoatleta/pesquive@gmail.com/')
        .then(res => res.json())
        .then((data) => {
            this.setState({
                isLoaded: true,
                items: data
            })
        })
        .catch(console.log);
    }
    
    render() {

        var { isLoaded, items} = this.state;

        if (!isLoaded) {
            return (<div>Loading...</div>);
        }

        else{
            console.log(items);
            return (
                <div>
                    <h1>Conexión completada</h1>
                </div>
                );
        }

        
    }
}

export default Success