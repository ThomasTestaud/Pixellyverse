<template>
  <BtnToolbar @click="open = true" :btn="'fa-solid fa-house'" />
  <div
    v-if="open"
    class="popup z-10 border border-black rounded-lg overflow-hidden bg-white"
    ref="popup"
  >
    <div v-if="!createRoom">
      <div @mousedown="startDrag()" class="flex justify-between items-center bg-green-700 text-white">
        <span class="text-center w-full">Rooms</span>
        <button class="" @click="open = false">
          <i class="fa-solid fa-x px-1"></i>
        </button>
      </div>

      <div class="p-2 flex flex-col">
        <button
          v-for="room in rooms"
          @click="selectRoom(room)"
          class="p-1 bg-gray-300 mb-1 rounded"
        >
          <span>{{ room.name }}</span>
        </button>
        <button
          @click="createRoom = true"
          class="rounded py-1 px-2 bg-yellow-500 text-white"
        >
          <i class="fa-solid fa-plus pr-2"></i>Create new room
        </button>
      </div>
    </div>

    <div v-if="createRoom">
      <div class="flex justify-between items-center bg-green-700 text-white">
        <span class="text-center w-full">Create new room</span>
        <button class="" @click="createRoom = false">
          <i class="fa-solid fa-x px-1"></i>
        </button>
      </div>
      <div class="p-2 flex flex-col">
        <input
          v-model="newRoom.name"
          class="p-1 bg-gray-300 mb-1 rounded"
          placeholder="Name"
        />
        <textarea
          v-model="newRoom.description"
          class="p-1 bg-gray-300 mb-1 rounded"
          placeholder="Description"
        ></textarea>
        <button
          @click="createRoomfunc()"
          class="rounded py-1 px-2 bg-yellow-500 text-white"
        >
          <i class="fa-solid fa-plus pr-2"></i>Create
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import axios from "axios";
import { onMounted, ref } from "vue";
import BtnToolbar from "../UI/BtnToolbar.vue";
import { useGeneralStore } from "../../stores/General.js";

const GeneralStore = useGeneralStore();
//console.log(GeneralStore.room);


const rooms = ref([]);
const createRoom = ref(false);
const newRoom = ref({
  name: "",
  description: "",
});

axios
  .get(import.meta.env.VITE_API_URL + "?/rooms")
  .then((res) => {
    console.log(res);
    rooms.value = res.data;
  })
  .catch((err) => {
    console.log(err);
  });

const selectRoom = (room) => {
  GeneralStore.room = room;

  axios
    .get(import.meta.env.VITE_API_URL + `?/rooms/id&id=${room.id}`, {
      headers: {
        "Content-Type": "application/json",
      },
    })

    .then((response) => {
      GeneralStore.roomPixels = response.data;
      //console.log(GeneralStore.roomPixels);
    })
    .catch((error) => {
      console.error("Error:", error);
    });
};

const createRoomfunc = () => {
  axios
    .post(import.meta.env.VITE_API_URL + "?/rooms", {
      name: newRoom.value.name,
      description: newRoom.value.description,
    })
    .then((res) => {
      console.log(res);
      rooms.value = res.data;
      createRoom.value = false;
    })
    .catch((err) => {
      console.log(err);
    });
};

const open = ref(true);
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

<style>
body {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  margin: 0;
}

.popup {
  position: fixed;
  top: 50%;
  left: 200px;
  transform: translate(-50%, -8px);
  cursor: grab;
  width: 300px;
  /*z-index: 1;*/
  /* Ensure the pop-up is on top */
}

.popup:active {
  cursor: grabbing;
}
</style>
