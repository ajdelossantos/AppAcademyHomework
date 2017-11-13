// Presentational component
import React from 'react';

// Object destructuring here... see below for literal approach
// const FruitStand = ({fruits, addApple, addOrange, clearFruit}) => (
//   <div>
//     <ul>
//       {fruits.map((fruit, idx) => <li key={idx}>{fruit}</li>)}
//     </ul>
//
//     <button onClick={addApple}>Apple</button>
//     <button onClick={addOrange}>Orange</button>
//     <button onClick={clearFruit}>Clear</button>
//   </div>
// );

  const FruitStand = (props) => (
    <div>
      <ul>
        {props.fruits.map((fruit, idx) => <li key={idx}>{ fruit }</li>)}
      </ul>

      <button onClick={props.addApple}>Apple</button>
      <button onClick={props.addOrange}>Orange</button>
      <button onClick={props.clearFruit}>Clear</button>
    </div>
  );

export default FruitStand;
