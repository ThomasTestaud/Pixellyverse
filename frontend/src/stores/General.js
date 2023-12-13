import { defineStore } from 'pinia';

export const useGeneralStore = defineStore('GeneralStore', {
  state: () => {
    return {
      zoom: 10,
      offset: [0, 0],
      room: null,
      roomPixels: [],
      playerPosition: [0, 0],
      playerPixels: [
        {x: 0, y: 0, color: 'black'},
        {x: 0, y: 1, color: 'blue'},
        {x: 0, y: 2, color: 'red'},
        {x: 0, y: 3, color: 'green'},
      ],
    }
  },
});
