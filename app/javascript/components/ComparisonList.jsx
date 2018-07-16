import React from 'react';
import PropTypes from 'prop-types';
import { css, withStyles } from '@material-ui/core/styles';
import ComparisonListItemDetails from 'components/ComparisonListItemDetails';
import ComparisonListItemHeader from 'components/ComparisonListItemHeader';
import ExpansionPanel from '@material-ui/core/ExpansionPanel';
import ExpansionPanelSummary from '@material-ui/core/ExpansionPanelSummary';
import ExpansionPanelDetails from '@material-ui/core/ExpansionPanelDetails';
import { IntlProvider } from 'react-intl';
import Typography from '@material-ui/core/Typography';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';

const styles = theme => ({
  root: {
    width: '100%',
  },
});

function ComparisonList(props) {
  const { classes, comparisons } = props;
  return (
    <IntlProvider locale='en'>
      <div className={classes.root}>
      { comparisons.map((comparison, i) =>
        <ExpansionPanel key={i}>
          <ExpansionPanelSummary expandIcon={<ExpandMoreIcon />}>
            <ComparisonListItemHeader comparison={ comparison } />
          </ExpansionPanelSummary>
          <ExpansionPanelDetails>
            <ComparisonListItemDetails comparison={ comparison } />
          </ExpansionPanelDetails>
        </ExpansionPanel>
      )}
      </div>
    </IntlProvider>
  );
}

ComparisonList.propTypes = {
  classes: PropTypes.object.isRequired,
  comparisons: PropTypes.array.isRequired,
};

export default withStyles(styles)(ComparisonList);
