import React from 'react';
import {
  BrowserRouter as Router,
  Redirect,
  Route,
  Switch,
  Link
} from 'react-router-dom';

import LogIn from '../../components/login/login';
import { Container, Row, Col, Navbar, Nav, Button, FormControl, Form } from 'react-bootstrap';

class Menu extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      dataUser: props.dataUser
    };
  }

  render() {
    return (
      <div style={{ marginTop: '2%' }}>
        <Container>
          <Row >
            <Col md="auto">
              <Router>
                <header>
                  <div className="row">
                    <div className="col-lg-auto">
                      <Navbar bg="light" variant="light">
                        <Navbar.Brand>{<Link to="/">FarmaTEC</Link>}</Navbar.Brand>
                        <Nav className="mr-auto">
                          <Nav.Link >{<Link to="/login">Sucursales</Link>}</Nav.Link>
                        </Nav>
                        <Form inline>
                          <FormControl type="text" placeholder="Busca tus productos" className="mr-sm-2" />
                          <Button variant="outline-primary">Buscar</Button>
                        </Form>
                      </Navbar>
                    </div>
                    <div className="col-md-auto">
                      <a href="http://localhost:3000">Cerrar Sesion</a>
                    </div>
                  </div>
                </header>
                <main>
                  <Switch>
                    <Route path='/login' exact component={() => <LogIn  userType={this.state.dataUser.type} userId={this.state.dataUser.id} />} />
                    <Redirect to='/' />
                    Main Content Here!
                </Switch>
                </main>
              </Router>
            </Col>
          </Row>
        </Container>
      </div>
    );
  }
}

export default Menu;