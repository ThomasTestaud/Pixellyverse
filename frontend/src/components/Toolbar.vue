<template>
    <header class="border-t p-2 fixed bottom-0 bg-black w-full">
        <div class="flex justify-start items-center">
            
            
            <RoomSelector />
        </div>
    </header>
</template>

<script setup>
import { RouterLink } from 'vue-router';
import { ref } from 'vue';
import RoomSelector from '../components/tools/RoomSelector.vue';

</script>
