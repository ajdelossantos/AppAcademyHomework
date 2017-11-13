
// These do the talking!
// Use the connect fct to bind different parts of app
// Generates PROPS from STATE, passes them to Presentational components
// Generates PROPS for actions i.e. event handlers

import { connect } from 'react-redux';
import { addApple, addOrange, clearFruit } from '../actions';
import FruitStand from './fruit_stand';

// const mapStateToProps = state => ({
//   fruits: state.fruits
// });
//
// const mapDispatchToProps = dispatch => ({
//   addApple: () => dispatch(addApple()),
//   addOrange: () => dispatch(addOrange()),
//   clearFruit: () => dispatch(clearFruit())
// });

const mapDispatchToProps = dispatch => ({
  addApple: () => dispatch(addApple()),
  addOrange: () => dispatch(addOrange()),
  clearFruit: () => dispatch(clearFruit())
});

const mapStateToProps = state => ({
  fruits: state.fruits // now this is a prop to be passed to presentaation component
});

// invokes above fct
export default connect(
  // uses currying pattern to connect presentational component to redux store
  mapStateToProps,
  mapDispatchToProps
)(FruitStand);
