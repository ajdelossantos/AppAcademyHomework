import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { num1: "", num2: "", result: 0 };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);

    this.addNums = this.addNums.bind(this);
    this.subtractNums = this.subtractNums.bind(this);
    this.multiplyNums = this.multiplyNums.bind(this);
    this.divideNums = this.divideNums.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(event) {
    //IDEA event.target.value came from the 'onChange' listener
    const num1 = event.target.value ? parseInt(event.target.value) : "";

    // automatic assignment w/ object destructuring => {num1: num1}
    this.setState({ num1 });
  }

  setNum2(event) {
    const num2 = event.target.value ? parseInt(event.target.value) : "";
    this.setState({ num2 });
  }

  addNums(event) {
    event.preventDefault();
    const result = parseInt(this.state.num1) + parseInt(this.state.num2);
    this.setState({ result });
  }

  subtractNums(event) {
    event.preventDefault();
    const result = parseInt(this.state.num1) - parseInt(this.state.num2);
    this.setState({ result });
  }

  multiplyNums(event) {
    event.preventDefault();
    const result = parseInt(this.state.num1) * parseInt(this.state.num2);
    this.setState({ result });
  }

  divideNums(event) {
    event.preventDefault();
    const result = parseInt(this.state.num1) / parseInt(this.state.num2);
    this.setState({ result });
  }

  clear() {
    event.preventDefault();
    this.setState = ({ num1: "", num2: "", result: 0 });
  }

  render(){
    return (
      <div>
        <h1>Hark, a calculator</h1>
        <h1>{this.state.result}</h1>

        <input onChange={ this.setNum1 } value={ this.state.num1 }></input>
        <input onChange={ this.setNum2 } value={ this.state.num2 }></input>

        <button onClick={ this.addNums }>+</button>
        <button onClick={ this.subtractNums }>-</button>
        <button onClick={ this.multiplyNums }>*</button>
        <button onClick={ this.divideNums }>/</button>
        <button onClick={ this.clear }></button>
      </div>
    );
  }
}

export default Calculator;
