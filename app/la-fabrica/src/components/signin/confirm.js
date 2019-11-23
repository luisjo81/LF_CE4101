import React, { Component } from 'react'
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import { Grid } from '@material-ui/core';
import AppBar from 'material-ui/AppBar';
import { List, ListItem } from 'material-ui/List';
import RaisedButton from 'material-ui/RaisedButton';

export class Confirm extends Component {
    
    continue = e => {
        e.preventDefault();
        //Aquí se envía la información al API - Base
        this.props.nextStep();
    }

    back = e => {
        e.preventDefault();
        //Aquí se envía la información al API - Base
        this.props.prevStep();
    }
    
    render() {
        const { values: { firstName, lastName, email, occupation, city, bio }} = this.props;
        return (
            <MuiThemeProvider>
                <React.Fragment>
                    <AppBar title = "Confirm User Data" />
                    <Grid container spacing={0} direction="column" alignItems="center" justify="center" style={{ minHeight: '100vh' }}>
                        <List>
                            <ListItem
                                primaryText = "First Name"
                                secondaryText = { firstName } 
                            />
                            <ListItem
                                primaryText = "Last Name"
                                secondaryText = { lastName } 
                            />
                            <ListItem
                                primaryText = "Email"
                                secondaryText = { email } 
                            />
                            <ListItem
                                primaryText = "Occupation"
                                secondaryText = { occupation } 
                            />
                            <ListItem
                                primaryText = "City"
                                secondaryText = { city } 
                            />
                            <ListItem
                                primaryText = "Bio"
                                secondaryText = { bio } 
                            />
                        </List>
                        <br/>
                        <RaisedButton
                            label = "Confirm and Continue" 
                            primary = {true}
                            styles = {styles.button}
                            onClick = {this.continue}
                        />
                        <RaisedButton
                            label = "Back" 
                            primary = {true}
                            styles = {styles.button}
                            onClick = {this.back}
                        />
                    </Grid>
                </React.Fragment>
            </MuiThemeProvider>
        )
    }
}

const styles = {
    button: {
        margin: 15
    }
}

export default Confirm