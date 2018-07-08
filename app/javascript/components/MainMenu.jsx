import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';

const styles = {
  root: {
    flexGrow: 1,
  },
  flex: {
    flex: 1,
  },
  menuButton: {
    marginLeft: -12,
    marginRight: 20,
  },
};

function MainMenu(props) {
  const {
    classes,
    destroy_user_session_path,
    user_github_omniauth_authorize_path,
    user_signed_in,
  } = props;
  return (
    <div className={classes.root}>
      <CssBaseline />
      <AppBar position="static">
        <Toolbar>
          <Typography variant="title" color="inherit" className={classes.flex}>
            WhatTheShift
          </Typography>
          {user_signed_in ? (
            <Button color="inherit" href={destroy_user_session_path}>Logout</Button>
          ) : (
            <Button color="inherit" href={user_github_omniauth_authorize_path}>Login with Github</Button>
          )}
        </Toolbar>
      </AppBar>
    </div>
  );
}

MainMenu.propTypes = {
  classes: PropTypes.object.isRequired,
  destroy_user_session_path: PropTypes.string.isRequired,
  user_github_omniauth_authorize_path: PropTypes.string.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
};

export default withStyles(styles)(MainMenu);
