// Ways to Call a Function
function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I\'m chasing ${cat.name}! Woof!`);
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov); // this is Noodles

Noodles.chase.call(Markov, Noodles); // this is now Markov?
Noodles.chase.apply(Markov, [Noodles]);
