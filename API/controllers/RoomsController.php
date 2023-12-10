<?php

class RoomsController
{
    public function get_room()
    {
        $model = new Models\Database();
        $req = "SELECT * FROM `room_pixels`";
        
        echo json_encode($model->generalQuery($req));
    }

    public function update_room()
    {
        $rawData = file_get_contents("php://input");
        $data = json_decode($rawData, true);
        
        $model = new Models\Database();
        $req = "INSERT INTO `room_pixels`(`room_id`, `x`, `y`, `color`) VALUES ( 1, :x, :y, :color)";
        
        $params = [
            'x' => $data['x'],
            'y' => $data['y'],
            'color' => $data['color'],
        ];
        
        $model->generalQueryNoReturn($req, $params);

        $this->get_room();
    }

}
