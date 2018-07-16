import React from 'react';
import PropTypes from 'prop-types';
import { css, withStyles } from '@material-ui/core/styles';
import Chip from '@material-ui/core/Chip';
import Avatar from '@material-ui/core/Avatar';
import DoneIcon from '@material-ui/icons/Done';
import green from '@material-ui/core/colors/green';

const styles = theme => ({
  chip: {
    background: green[500],
    color: 'white'
  },
  avatar: {
    background: green[500],
    color: 'white'
  },
});

function ComparisonList(props) {
  const { classes, comparisons } = props;
  return (
    <Chip
      avatar={
        <Avatar classes={{colorDefault: classes.avatar}}>
          <DoneIcon />
        </Avatar>
      }
      label="No Changes"
      classes={{root: classes.chip}}
    />
  );
}

ComparisonList.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(ComparisonList);
