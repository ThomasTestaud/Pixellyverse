<template>
  <button v-if="drawMode" @click="colorPixel" ref="screen" class="border-2 border-red-500 fixed top-0 left-0 w-full h-full"
    style="z-index: -100;"></button>

  <Popup @open-change="onOpenChange" :title="'Drawing tool'" :btn="'fa-solid fa-pen'">
    <template v-slot:popup-content>
      <button @click="selectedColor = color" v-for="color in colors" :key="color" :style="{ backgroundColor: color }"
        class="w-12 h-12 rounded border mx-1">
      </button>
    </template>
  </Popup>
</template>

<script setup>
import { useGeneralStore } from "../../stores/General.js";
import { ref, onMounted } from 'vue';
import axios from 'axios';
import BtnToolbar from "../UI/BtnToolbar.vue";
import Popup from "../UI/Popup.vue";

const store = useGeneralStore();
const drawMode = ref(false);

const selectedColor = ref(null);
const colors = [
  "#f08080", "#f4978e", "#f8ad9d", "#fbc4ab", "#ffdab9",
  "#6f1d1b", "#bb9457", "#432818", "#99582a", "#ffe6a7",
  "#90f1ef", "#ffd6e0", "#ffef9f", "#c1fba4", "#7bf1a8",
  "#ee6055", "#60d394", "#aaf683", "#ffd97d", "#ff9b85",
  "#8ecae6", "#219ebc", "#023047", "#ffb703", "#fb8500",
  "#ffffff", "#dee2e6", "#adb5bd", "#495057", "#000000"
];

// Get the canvas element
const screen = ref(null);

// Function to handle click event on canvas
const colorPixel = (e) => {
  if (selectedColor.value === null) {
    return;
  }

  const x = Math.floor((e.clientX - store.offset[0]) / store.zoom);
  const y = Math.floor((e.clientY - store.offset[1]) / store.zoom);

  sendPixel(x, y, selectedColor.value);
};

// Function to send pixel to the server using axios
const sendPixel = (x, y, color) => {
  const data = { x, y, color };
  const roomId = store.room.id;

  axios.put(import.meta.env.VITE_API_URL + `?/rooms/id&id=${roomId}`, data, {
    headers: {
      'Content-Type': 'application/json',
    },
  })
    .then((response) => {
      console.log(selectedColor.value);
      store.roomPixels = response.data;
    })
    .catch((error) => {
      console.error('Error:', error);
    });
};

// Handle the custom event emitted from the Popup component
const onOpenChange = (value) => {
  drawMode.value = value;
  console.log(drawMode.value);
};
</script>
