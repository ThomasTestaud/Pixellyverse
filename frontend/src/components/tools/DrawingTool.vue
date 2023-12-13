<template>
  <button v-if="open" @click="colorPixel" ref="screen" class="fixed top-0 left-0 w-full h-full" style="z-index: -100;"></button>
  <BtnToolbar @click="open = !open" :btn="'fa-solid fa-pen'"/>
  <div
    
    v-if="open"
    class="popup z-10 border border-black rounded-lg overflow-hidden bg-white"
    ref="popup"
  >
    <div v-if="!createRoom">
      <div @mousedown="startDrag()" class="flex justify-between items-center bg-green-700 text-white">
        <span class="text-center w-full">Draw tool</span>
        <button class="" @click="open = false">
          <i class="fa-solid fa-x px-1"></i>
        </button>
      </div>

      <div class="p-2 inline-block">
        
        <button @click="selectedColor = color" v-for="color in colors" :key="color" :style="{ backgroundColor: color }" class="w-12 h-12 rounded border mx-1">
        </button>
        
      </div>
    </div>
  </div>
</template>

<script setup>
import { useGeneralStore } from "../../stores/General.js";
import { ref, onMounted } from 'vue';
import axios from 'axios';
import BtnToolbar from "../UI/BtnToolbar.vue";

const store = useGeneralStore();

const selectedColor = ref(null);
const colors = [
  "#f08080","#f4978e","#f8ad9d","#fbc4ab","#ffdab9",
  "#6f1d1b","#bb9457","#432818","#99582a","#ffe6a7",
  "#90f1ef","#ffd6e0","#ffef9f","#c1fba4","#7bf1a8",
  "#ee6055","#60d394","#aaf683","#ffd97d","#ff9b85",
  "#8ecae6","#219ebc","#023047","#ffb703","#fb8500",
  "#ffffff","#dee2e6","#adb5bd","#495057","#000000"
];

// Get the canvas element
const screen = ref(null);

// Function to handle click event on canvas
const colorPixel = (e) => {
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



const open = ref(false);
const popup = ref(null);
let isDragging = true;
let offsetX = 0;
let offsetY = 0;

const startDrag = () => {
  if (isDragging) {
    document.addEventListener("mousemove", drag);
    document.addEventListener("mouseup", stopDrag);
  }
};

const drag = (e) => {
  e.preventDefault();
  popup.value.style.left = e.pageX - offsetX + "px";
  popup.value.style.top = e.pageY - offsetY + "px";
};

const stopDrag = () => {
  document.removeEventListener("mousemove", drag);
  document.removeEventListener("mouseup", stopDrag);
};
</script>
