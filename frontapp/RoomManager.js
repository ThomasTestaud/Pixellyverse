export function setupRoomManager() {
  
  const url = "http://localhost:3000/Pixellyverse/API/index.php";

  const component = `
    <h2>All the rooms</h2>
`;

    document.querySelector('#room-manager').innerHTML = component; 

  // Send the pixel to the server in put request
  const sendPixel = (x, y, color) => {
      const data = { x, y, color };
      fetch(url + "?/rooms/id&id=" + roomId, {
          method: "PUT",
          headers: {
              "Content-Type": "application/json"
          },
          body: JSON.stringify(data)
      }).then((res) => {
          if (!res.ok) {
              throw new Error(`HTTP error! Status: ${res.status}`);
          }
          return res.json(); // Use .json() to extract JSON data from the response
      }).then((data) => {
          console.log(data);
          pixels = data;
          draw();
      }).catch((err) => {
          console.error(err);
      });
  };

}
