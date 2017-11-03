// Simple Timeout
// First, set a simple timeout for 5000 ms (use window.setTimeout)
// Pass in a callback function that calls alert('HAMMERTIME')

window.setTimeout(function () {
  alert(`STOP`);
}, 5000); // Seems asynchronous

function hammerTime(time) {
  window.setTimeout(function () {
    alert(`${time} is hammertime!`);
  }, time);
}
