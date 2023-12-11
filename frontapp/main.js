import './style.css'
import { setupDrawingTool } from './DrawingTool.js'
import { setupRoomManager } from './RoomManager.js'

document.querySelector('#app').innerHTML = `
  <canvas id="myCanvas"></canvas>
  <div class="colorpicker">
  <button onclick="color = 'red'">Red</button>
  <button onclick="color = 'blue'">Blue</button>
  <button onclick="color = 'green'">Green</button>
  </div>
  <div class="zoom">
  <button onclick="assignZoom(10)">10x</button>
  <button onclick="assignZoom(20)">20x</button>
  <button onclick="assignZoom(30)">30x</button>
  <button onclick="assignZoom(40)">40x</button>
  <button onclick="assignZoom(50)">50x</button>
  </div>
  <div id=room-manager-btn></div>
  <div id=room-manager></div>
`
console.log('test');
setupDrawingTool()
setupRoomManager()

