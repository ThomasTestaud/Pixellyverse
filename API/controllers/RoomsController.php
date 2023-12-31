<?php

class RoomsController
{
    public function get_room()
    {
        $model = new Models\Database();
        $req = "SELECT * FROM `room_pixels` WHERE room_id = :room_id";

        $params = [
            'room_id' => $_GET['id'],
        ];
        
        echo json_encode($model->generalQuery($req, $params));
    }

    public function get_rooms()
    {
        $model = new Models\Database();
        $req = "SELECT * FROM `rooms`";
        
        echo json_encode($model->generalQuery($req));
    }

    public function update_room()
    {
        $rawData = file_get_contents("php://input");
        $data = json_decode($rawData, true);
        
        $model = new Models\Database();
        $req = "INSERT INTO `room_pixels`(`room_id`, `x`, `y`, `color`) VALUES ( :id, :x, :y, :color)";
        
        $params = [
            'x' => $data['x'],
            'y' => $data['y'],
            'color' => $data['color'],
            'id' => $_GET['id']
        ];
        
        $model->generalQueryNoReturn($req, $params);

        $this->get_room();
    }

    public function create_room()
    {
        $rawData = file_get_contents("php://input");
        $data = json_decode($rawData, true);
        
        $model = new Models\Database();
        $req = "INSERT INTO `rooms`(`user_id`, `name`, `description`, `status`) VALUES (:userId, :name, :description, :status)";
        
        $params = [
            'name' => $data['name'],
            'description' => $data['description'],
            'userId' => 1,
            'status' => 0,
        ];
        
        $model->generalQueryNoReturn($req, $params);

        $this->get_rooms();
    }

}
