<template>
  <Popup @open-change="onOpenChange" :title="'Settings'" :btn="'fa-solid fa-gear'">
    <template v-slot:popup-content>

      <div class="">
        <h3>Zoom:</h3>
        <div class="flex justify-around">
          <button @click="store.zoom = zoom" v-for="zoom in zooms"
            class="border rounded p-1 bg-gray-100 w-10 text-center">x{{ zoom }}</button>
        </div>
      </div>

    </template>
  </Popup>
</template>

<script setup>
import { useGeneralStore } from "../../stores/General.js";
import Popup from "../UI/Popup.vue";

const store = useGeneralStore();

const zooms = [1, 2, 5, 10, 20];
</script>
