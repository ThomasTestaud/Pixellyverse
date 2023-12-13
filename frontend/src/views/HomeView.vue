<template>
  <canvas id="myCanvas" ref="canvas" @click="colorPixel"></canvas>
  <canvas  @mousedown="startDrag"  ref="playerCanvas" @click="colorPixel"></canvas>
</template>

<script setup>
import { ref, onMounted, watchEffect } from 'vue';
import { useGeneralStore } from "../stores/General.js";

const store = useGeneralStore();

let pixels = [];
const canvas = ref(null);
const playerCanvas = ref(null);
let isDragging = false;
let offsetX = 0;
let offsetY = 0;

onMounted(() => {
  const draw = () => {
    const ctx = canvas.value.getContext("2d");
    canvas.value.width = window.innerWidth;
    canvas.value.height = window.innerHeight;

    for (let i = 0; i < pixels.length; i++) {
      ctx.fillStyle = pixels[i].color;
      ctx.fillRect(
        pixels[i].x * store.zoom + store.offset[0],
        pixels[i].y * store.zoom + store.offset[1],
        1 * store.zoom,
        1 * store.zoom
      );
    }

  };

  const drawPlayers = () => {
    const ctxPlayer = playerCanvas.value.getContext("2d");
    playerCanvas.value.width = window.innerWidth;
    playerCanvas.value.height = window.innerHeight;
    
    for (let i = 0; i < store.playerPixels.length; i++) {
      ctxPlayer.fillStyle = store.playerPixels[i].color;
      ctxPlayer.fillRect(
        (store.playerPixels[i].x + store.playerPosition[0] + store.offset[0]),
        (store.playerPixels[i].y + store.playerPosition[1] + store.offset[1]),
        1,
        1
      );
    }

  }

  let lastRoom = store.room;
  watchEffect(() => {
    console.log('refresh');
    
    pixels = store.roomPixels; 
    if (lastRoom !== store.room) {
      store.offset = [0,0];
      lastRoom = store.room;
    }
    drawPlayers();
    draw();
  });
});

const moveTo = (x, y) => {
  const thisx = x - store.offset[0];
  const thisy = y - store.offset[1];

  store.playerPosition = [thisx, thisy];
}

const startDrag = (e) => {
  
  e.preventDefault(); // Prevents undesirable text selection

  moveTo(e.clientX, e.clientY)

  offsetX = e.clientX;
  offsetY = e.clientY;
  isDragging = true;

  document.addEventListener("mousemove", drag);
  document.addEventListener("mouseup", stopDrag);
};

const drag = (e) => {
  e.preventDefault();
  store.offset[0] += e.clientX - offsetX;
  store.offset[1] += e.clientY - offsetY;
  offsetX = e.clientX;
  offsetY = e.clientY;
};

const stopDrag = () => {
  isDragging = false;
  document.removeEventListener("mousemove", drag);
  document.removeEventListener("mouseup", stopDrag);
};
</script>

<style>
html,
body {
  margin: 0;
  padding: 0;
  height: 100%;
}

canvas {
  position: absolute;
  top: 0px;
  left: 0px;
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
