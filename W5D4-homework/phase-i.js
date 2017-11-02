// Phase I

// IDEA closure captures and mutates x
function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// IDEA constant x's have different scope
function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// IDEA error, const x already defined, so var x not allowed
function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

//  IDEA let defines x's in blocks
function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// IDEA REPL did not like this one... x was already defined in scope and not mutated
function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// madLib
function madLib(verb, adj, noun) {
  console.log('We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}')
}

// isSubstring
function isSubstring(searchString, subString) {
  let strArray = searchString.split(" ");

  return strArray.includes(subString);
}

function fizzBuzz(array) {
  let result = [];

  array.forEach(function (n) {
    if (n % 15 === 0) {
      result.push('FizzBuzz');
    } else if (n % 5 === 0) {
        result.push('Buzz');
    } else if (n % 3 === 0) {
        result.push('Fizz');
    } else {
      result.push(n);
    }
  });

  return result;
};

function isPrime(number) {
  let div = 3;
  let upperBound = Math.sqrt(number);

  if (number === 2 || number === 3) {
    return true;
  } else if (number % 2 === 0) {
    return false;
  };

  while (div <= upperBound) {
    if (number % div === 0) {
      return false;
    } else {
      div += 2;
    };
  };

  return true;
};

function sumOfNPrimes (number) {
  let sum = 0,
    numPrimes = 0,
    i = 2;

  while (numPrimes < number) {
    if (isPrime(i)) {
      sum += i;
      numPrimes ++;
    };
    i++;
  };

  return sum;
};

// Phase II
// TODO Ask for TA help on this one...
function titleize(array, cb) {
    array.map(el => 'Mx. ${el} Jingleheimer Schmidt');
};

// Constructing an elephant
