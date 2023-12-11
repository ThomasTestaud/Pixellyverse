export function setupDrawingTool(element) {
  
  const url = "http://localhost:3000/Pixellyverse/API/index.php";
  let zoom = 10;
  let roomId = 1;

  const assignZoom = (z) => {
      zoom = z;
      draw();
  }

  let color = "red";

  let pixels = [];


  // Get the canvas element
  var canvas = document.getElementById("myCanvas");
  var ctx = canvas.getContext("2d");

  const draw = () => {

      // Set the canvas size to match the window size
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;

      // Draw a square on the canvas
      //ctx.fillStyle = "black";
      //ctx.fillRect(0, 0, canvas.width, canvas.height);

      for (let i = 0; i < pixels.length; i++) {
          ctx.fillStyle = pixels[i].color;
          ctx.fillRect(pixels[i].x * zoom, pixels[i].y * zoom, 1 * zoom, 1 * zoom);
      }
  }


  // Add a click listener to the canvas
  canvas.addEventListener("click", (e) => {
      const x = Math.floor(e.clientX / zoom);
      const y = Math.floor(e.clientY / zoom);

      pixels.push({ x, y, color });

      sendPixel(x, y, color);

      draw();
  });

  // Send the pixel to the server in put request
  const sendPixel = (x, y, color) => {
      const data = { x, y, color };
      fetch(url + "?/rooms/id&id=" + roomId, {
          method: "PUT",
          headers: {
              "Content-Type": "application/json"
          },
          body: JSON.stringify(data)
      }).then((res) => {
          if (!res.ok) {
              throw new Error(`HTTP error! Status: ${res.status}`);
          }
          return res.json(); // Use .json() to extract JSON data from the response
      }).then((data) => {
          console.log(data);
          pixels = data;
          draw();
      }).catch((err) => {
          console.error(err);
      });
  };

  // Get the pixel data from the server
  const getPixels = () => {
      fetch(url + "?/rooms/id&id=" + roomId, {
          method: "GET",
          headers: {
              "Content-Type": "application/json"
          }
      }).then((res) => {
          if (!res.ok) {
              throw new Error(`HTTP error! Status: ${res.status}`);
          }
          return res.json(); // Use .json() to extract JSON data from the response
      }).then((data) => {
          console.log(data);
          pixels = data;
          draw();
      }).catch((err) => {
          console.error(err);
      });
  };



  getPixels();
}
