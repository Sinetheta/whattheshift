import React from 'react';
import PropTypes from 'prop-types';
import { css, withStyles } from '@material-ui/core/styles';
import GridList from '@material-ui/core/GridList';
import GridListTile from '@material-ui/core/GridListTile';
import GridListTileBar from '@material-ui/core/GridListTileBar';
import ListSubheader from '@material-ui/core/ListSubheader';
import IconButton from '@material-ui/core/IconButton';
import InfoIcon from '@material-ui/icons/Info';

const styles = theme => ({
  titleBar: {
    background:
      'linear-gradient(to bottom, rgba(0,0,0,0.7) 0%, ' +
      'rgba(0,0,0,0.3) 70%, rgba(0,0,0,0) 100%)',
  },
});

function ComparisonListItemDetails(props) {
  const { classes, comparison } = props;
  return (
    <div className={classes.root}>
      { comparison.image_diffs.map((image_diff, i) =>
        <GridList cols={3} key={i} className={classes.gridList}>
          <GridListTile key="Subheader" cols={3}  style={{ height: 'auto' }}>
            <ListSubheader component="div" color="primary">{image_diff.before_image.identifier}</ListSubheader>
          </GridListTile>
          <GridListTile>
            <img src={image_diff.before_image.url} />
            <GridListTileBar titlePosition="top" className={classes.titleBar} title="Before" />
          </GridListTile>
          <GridListTile>
            <img src={image_diff.after_image.url} />
            <GridListTileBar titlePosition="top" className={classes.titleBar} title="After" />
          </GridListTile>
          <GridListTile>
            <img src={image_diff.url} />
            <GridListTileBar titlePosition="top" className={classes.titleBar} title="Diff" />
          </GridListTile>
        </GridList>
      )}
    </div>
  );
}

ComparisonListItemDetails.propTypes = {
  classes: PropTypes.object.isRequired,
  comparison: PropTypes.object.isRequired,
};

export default withStyles(styles)(ComparisonListItemDetails);
