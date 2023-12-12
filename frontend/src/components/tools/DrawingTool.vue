<template>
    <div @click="colorPixel()" ref="screen" class="border border-red-500 fixed top-0 left-0 w-full h-full"></div>
</template>

<script setup>
import { useGeneralStore } from "../../stores/General.js";
import { ref, onMounted, watchEffect } from 'vue';

const GeneralStore = useGeneralStore();

// Get the canvas element
const screen = ref(null);

// Function to handle click event on canvas
const colorPixel = (e) => {
  const x = Math.floor(e.clientX / zoom);
  const y = Math.floor(e.clientY / zoom);

  pixels.push({ x, y, color });

  sendPixel(x, y, color);

  //draw();
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
    GeneralStore.roomPixels = response.data;
  })
  .catch((error) => {
    console.error('Error:', error);
  });
};

</script>