import { defineStore } from 'pinia';

export const useGeneralStore = defineStore('GeneralStore', {
  state: () => {
    return {
      room: null,
      roomPixels: [],
    }
  },
});
