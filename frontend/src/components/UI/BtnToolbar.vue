<template>
  <button
    class="bg-green-900 hover:bg-green-700 p-2 rounded-2xl text-white flex justify-center items-center transition-all duration-300 ease-in-out"
  >
    <i :class="props.btn"></i>
  </button>
</template>

<script setup>
  const props = defineProps({
    btn: String
  })
</script>
