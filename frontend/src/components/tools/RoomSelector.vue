<template>

  <Popup @open-change="createRoom = false" :title="'Rooms'" :btn="'fa-solid fa-house'">
    <template  v-if="!createRoom" v-slot:popup-content>

      <div class="flex flex-col">
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

    </template>
    <template v-if="createRoom"  v-slot:popup-content>
  
      <div class="flex flex-col">
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
  
    </template>
  </Popup>

</template>

<script setup>
import axios from "axios";
import { onMounted, ref } from "vue";
import BtnToolbar from "../UI/BtnToolbar.vue";
import { useGeneralStore } from "../../stores/General.js";
import Popup from "../UI/Popup.vue";

const GeneralStore = useGeneralStore();

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
</script>


