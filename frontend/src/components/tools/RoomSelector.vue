<template>
  <BtnToolbar v-model="open" :btn="'fa-solid fa-house'" />
  <template v-if="open">
    <div @mousedown="startDrag()" class="popup" ref="popup">Drag me!</div>
  </template>
</template>

<script setup>
import axios from "axios";
import { onMounted, ref } from "vue";
import BtnToolbar from "../UI/BtnToolbar.vue";

const open = ref(true);

axios
  .get(import.meta.env.VITE_API_URL + "?/rooms")
  .then((res) => {
    console.log(res);
  })
  .catch((err) => {
    console.log(err);
  });

const popup = ref(null);

let isDragging = true;
let offsetX = 0;
let offsetY = 0;

const startDrag = () => {
  console.log("start drag");
  if (isDragging) {
    const x = 50;
    const y = 50;

    // Check boundaries to prevent moving outside the viewport
    const maxX = window.innerWidth - popup.value.offsetWidth;
    const maxY = window.innerHeight - popup.value.offsetHeight;

    popup.value.style.left = `${Math.min(maxX, Math.max(0, x))}px`;
    popup.value.style.top = `${Math.min(maxY, Math.max(0, y))}px`;
  }
}

onMounted(() => {
  // Initialize offsetX and offsetY here if needed
});
</script>

<style>
body {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  margin: 0;
}

.popup {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ccc;
  cursor: grab;
  z-index: 1; /* Ensure the pop-up is on top */
}

.popup:active {
  cursor: grabbing;
}
</style>
