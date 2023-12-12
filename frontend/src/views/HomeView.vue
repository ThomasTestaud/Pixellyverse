<template>
  <canvas id="myCanvas" ref="canvas" @click="colorPixel"></canvas>

</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';


const url = "http://localhost:3000/Pixellyverse/API/index.php";
let zoom = 10;
let roomId = 1;

let color = "blue";
let pixels = [];

// Get the canvas element
const canvas = ref(null);

// Function to handle click event on canvas
const colorPixel = (e) => {
  const x = Math.floor(e.clientX / zoom);
  const y = Math.floor(e.clientY / zoom);

  pixels.push({ x, y, color });

  sendPixel(x, y, color);

  draw();
};

// Function to send pixel to the server using axios
const sendPixel = (x, y, color) => {
  const data = { x, y, color };
  axios.put(`${url}?/rooms/id&id=${roomId}`, data, {
    headers: {
      'Content-Type': 'application/json',
    },
  })
  .then((response) => {
    pixels = response.data;
    draw();
  })
  .catch((error) => {
    console.error('Error:', error);
  });
};

// Function to get pixel data from the server using axios
const getPixels = () => {
  axios.get(`${url}?/rooms/id&id=${roomId}`, {
    headers: {
      'Content-Type': 'application/json',
    },
  })
  .then((response) => {
    pixels = response.data;
    draw();
  })
  .catch((error) => {
    console.error('Error:', error);
  });
};

// Function to draw on the canvas
const draw = () => {
  const ctx = canvas.value.getContext("2d");

  // Set the canvas size to match the window size
  canvas.value.width = window.innerWidth;
  canvas.value.height = window.innerHeight;

  // Draw a square on the canvas
  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, canvas.value.width, canvas.value.height);

  for (let i = 0; i < pixels.length; i++) {
    ctx.fillStyle = pixels[i].color;
    ctx.fillRect(pixels[i].x * zoom, pixels[i].y * zoom, 1 * zoom, 1 * zoom);
  }
};

// Call getPixels on component mount
onMounted(getPixels);
</script>

<style>
html,
body {
  margin: 0;
  padding: 0;
  height: 100%;
}

canvas {
  display: block;
  width: 100%;
  height: 100%;
}

.colorpicker {
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
}

.zoom {
  position: absolute;
  top: 0;
  right: 0;
  z-index: 1;
}
</style>
