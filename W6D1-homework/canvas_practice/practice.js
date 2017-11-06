document.addEventListener("DOMContentLoaded", function(){
  // in your HTML this element appears as <canvas id="myCanvas"></canvas>
  const canvas = document.getElementById('mycanvas');
  const ctx = canvas.getContext('2d');

  canvas.width = 500;
  canvas.height = 500;

  ctx.fillStyle = 'rgb(0, 0, 100)';
  ctx.fillRect(10, 10, 500, 500);

  ctx.beginPath();
  //void ctx.arc(x, y, radius, startAngle, endAngle, anticlockwise);
  ctx.arc(200, 200, 75, 0, (2*Math.PI), true);
  ctx.strokeStyle = 'white';
  ctx.linewidth = 1;
  ctx.stroke();

  ctx.fillStyle = 'gray';
  ctx.fill();
});
