<template>
  <BtnToolbar @click="open = !open" :btn="props.btn"/>
  <div
    
    v-if="open"
    class="popup z-10 border border-black rounded-lg overflow-hidden bg-white"
    ref="popup"
  >
    <div>
      <div @mousedown="startDrag()" class="flex justify-between items-center bg-green-700 text-white">
        <span class="text-center w-full">{{ props.title }}</span>
        <button class="" @click="open = false">
          <i class="fa-solid fa-x px-1"></i>
        </button>
      </div>

      <div class="p-2">
        <slot name="popup-content">

        </slot>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue';
import BtnToolbar from "./BtnToolbar.vue";

const open = ref(false);
const popup = ref(null);
let isDragging = true;
let offsetX = 0;
let offsetY = 0;

const props = defineProps({
  title: String,
  btn: String,
});

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

const emit = defineEmits(["open-change"]);

const emitOpenChange = () => {
  emit("open-change", open.value);
};

// Watch for changes in the 'open' variable and emit the custom event
onMounted(() => {
  watch(open, () => {
    emitOpenChange();
  });
});
</script>

<style scoped>

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