<template>
  <Popup @open-change="drawUser" :title="'Drawing tool'" :btn="'fa-solid fa-user'">
    <template v-slot:popup-content>
      <button class="border mx-4">
        <canvas @click="colorPixel" ref="screen" id="screen-canvas" class="relative bg-gray-100"></canvas>
      </button>
      <button @click="selectedColor = color" v-for="color in colors" :key="color" :style="{ backgroundColor: color }"
        class="w-8 h-8 rounded border mx-1">
      </button>
    </template>
  </Popup>
</template>

<script setup>
import { useGeneralStore } from "../../stores/General.js";
import { ref, onMounted, watchEffect, watch } from 'vue';
import axios from 'axios';
import Popup from "../UI/Popup.vue";

const store = useGeneralStore();

const screen = ref(null);
const zoom = 10;
const offsetX = 12;
const offsetY = 24;

const drawUser = () => {
  window.requestAnimationFrame(() => {
    screen.value = document.getElementById('screen-canvas');
    if (screen.value) {
      const ctx = screen.value.getContext("2d");
      screen.value.width = 250;
      screen.value.height = 250;

      for (let i = 0; i < store.playerPixels.length; i++) {
        ctx.fillStyle = store.playerPixels[i].color;
        ctx.fillRect(
          (store.playerPixels[i].x + (offsetX)) * zoom,
          (store.playerPixels[i].y + (offsetY)) * zoom,
          1 * zoom,
          1 * zoom
        );
      }
    }
    
  });
};


//execute drawUser() when store.playerPixels changes using watch
watch(store.playerPixels, () => {
  drawUser();
});



const selectedColor = ref(null);
const colors = [
  "#f08080", "#f4978e", "#f8ad9d", "#fbc4ab", "#ffdab9",
  "#6f1d1b", "#bb9457", "#432818", "#99582a", "#ffe6a7",
  "#90f1ef", "#ffd6e0", "#ffef9f", "#c1fba4", "#7bf1a8",
  "#ee6055", "#60d394", "#aaf683", "#ffd97d", "#ff9b85",
  "#8ecae6", "#219ebc", "#023047", "#ffb703", "#fb8500",
  "#ffffff", "#dee2e6", "#adb5bd", "#495057", "#000000"
];

// Function to handle click event on canvas
const colorPixel = (e) => {
  if (selectedColor.value === null) {
    return;
  }
  //Get position of screen.value on the page and substract it from the mouse position
  const x = Math.floor((e.clientX - screen.value.getBoundingClientRect().left) / zoom - offsetX);
  const y = Math.floor((e.clientY - screen.value.getBoundingClientRect().top) / zoom - offsetY);

  sendPixel(x, y, selectedColor.value);
};

// Function to send pixel to the server using axios
const sendPixel = (x, y, color) => {
  store.playerPixels.push({ x, y, color });
};

</script>
