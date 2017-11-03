// Some tea? Some biscuits?
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

//TODO ask a TA--how do you open this in node?
function teaAndBiscuits () {
  // let first, second; this is broken

//IDEA Are these nested callbacks? Nest the whole thing?
  reader.question('Would you like some tea?', (res1) => {
    console.log(`You replied ${res1}.`); // Change the variables

    reader.question('Would you like some biscuits?', (res2) => {
      console.log(`You replied ${res2}.`); // Change the variables

      const firstRes = (res1 === 'yes') ? 'do' : 'don\'t';
      const secondRes = (res2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits, correct?`);
      reader.close();
    });
  });
}
