<?php

class UsersController
{
    public function get_users()
    {
        //echo 'users'; die();
        // Your logic to get all users (GET /api/users)
        $model = new Models\Database();
        $req = "SELECT * FROM `users`";
        
        $users = $model->generalQuery($req);
    }

    public function create_user()
    {
        // Your logic to create a new user (POST /api/users)
        echo json_encode(['message' => 'Create User']);
    }

    public function update_user()
    {
        // Extract the user ID from the URL (e.g., /api/users/123)
        $url_parts = explode('/', $_SERVER['REQUEST_URI']);
        $user_id = $url_parts[count($url_parts) - 1];

        // Your logic to update the user with the specified ID (PUT /api/users/{id})
        echo json_encode(['message' => 'Update User ' . $user_id]);
    }

    public function delete_user()
    {
        // Extract the user ID from the URL (e.g., /api/users/123)
        $url_parts = explode('/', $_SERVER['REQUEST_URI']);
        $user_id = $url_parts[count($url_parts) - 1];

        // Your logic to delete the user with the specified ID (DELETE /api/users/{id})
        echo json_encode(['message' => 'Delete User ' . $user_id]);
    }
}
