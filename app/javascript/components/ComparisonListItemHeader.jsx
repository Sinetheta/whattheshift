import React from 'react';
import PropTypes from 'prop-types';
import { css, withStyles } from '@material-ui/core/styles';
import { FormattedRelative } from 'react-intl';
import Typography from '@material-ui/core/Typography';
import Grid from '@material-ui/core/Grid';
import Icon from '@material-ui/core/Icon';

const styles = theme => ({
  iconToday: {
    fontSize: '1em',
    marginBottom: '-0.2em',
    marginRight: '0.5em'
  },
  vsSpacer: {
    margin: '0 1em'
  }
});

const trunc = (str, n) =>
  str.substr(0, n - 1) + (str.length > n ? '...' : '')

function ComparisonListItemHeader(props) {
  const { classes, comparison } = props;
  return (
    <Grid container>
      <Grid item xs={2}>
        <Typography variant="title">{trunc(comparison.project.name, 15)}</Typography>
      </Grid>
      <Grid item xs>
        <Typography variant="subheading" >
          <span title={comparison.from_revision.identifier}>{trunc(comparison.from_revision.identifier, 25)}</span>
          <span className={classes.vsSpacer}>vs</span>
          <span title={comparison.from_revision.identifier}>{trunc(comparison.to_revision.identifier, 25)}</span>
        </Typography>
      </Grid>
      <Grid item xs={2}>
        <Typography variant="subheading" color="textSecondary">
          <Icon className={classes.iconToday}>calendar_today</Icon>
          <FormattedRelative value={comparison.created_at} />
        </Typography>
      </Grid>
    </Grid>
  );
}

ComparisonListItemHeader.propTypes = {
  classes: PropTypes.object.isRequired,
  comparison: PropTypes.object.isRequired,
};

export default withStyles(styles)(ComparisonListItemHeader);
