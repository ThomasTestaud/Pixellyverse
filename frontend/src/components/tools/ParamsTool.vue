<template>
  <BtnToolbar @click="open = !open" :btn="'fa-solid fa-gear'"/>
  <div
    v-if="open"
    class="popup z-10 border border-black rounded-lg overflow-hidden bg-white"
    ref="popup"
  >
    <div v-if="!createRoom">
      <div @mousedown="startDrag()" class="flex justify-between items-center bg-green-700 text-white">
        <span class="text-center w-full">Settings</span>
        <button class="" @click="open = false">
          <i class="fa-solid fa-x px-1"></i>
        </button>
      </div>

      <div class="p-2 ">
        
        <div class="">
          <h3>Zoom:</h3>
          <div class="flex justify-around">
            <button @click="store.zoom = zoom" v-for="zoom in zooms" class="border rounded p-1 bg-gray-100 w-10 text-center">x{{ zoom }}</button>
          </div>
        </div>
        
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


const zooms = [1, 2, 5, 10, 20];










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
