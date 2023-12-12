<?php

spl_autoload_register(function ($class) {
    require_once lcfirst(str_replace('\\', '/', $class)) . '.php';
});

header('Content-Type: application/json');

// Check if the request method is OPTIONS (preflight request)
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    // This is a preflight request
    header('Access-Control-Allow-Methods: POST, GET, PUT, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Content-Type, Authorization');
    header('Access-Control-Allow-Origin: *'); 
    exit;
}

// For actual requests
header('Access-Control-Allow-Origin: *'); 

// Get the request method and requested URI
$method = $_SERVER['REQUEST_METHOD'];
$request_uri = $_SERVER['REQUEST_URI'];

// Remove query string from the request URI
$uri_parts = explode('?', $request_uri);
$uri_parts = explode('&', $uri_parts[1]);
$path = $uri_parts[0];


// Define your routes
$routes = [
    'GET'    => [
        '/users' => 'get_users',
        '/posts' => 'get_posts',
        '/rooms/id' => 'get_room',
        '/rooms' => 'get_rooms',
    ],
    'POST'   => [
        '/users' => 'create_user',
        '/posts' => 'create_post',
    ],
    'PUT'    => [
        '/users/{id}' => 'update_user',
        '/posts/{id}' => 'update_post',
        '/rooms/id' => 'update_room',
    ],
    'DELETE' => [
        '/users/{id}' => 'delete_user',
        '/posts/{id}' => 'delete_post',
    ],
];

// Check if the requested route exists
if (isset($routes[$method][$path])) {
    // Extract the controller and method from the route
    $route_parts = explode('/', $path);
    $controller = ucfirst($route_parts[1]) . 'Controller';
    //echo $controller; die();
   
    $action = $routes[$method][$path];

    // Include the controller file
    require_once 'controllers/' . $controller . '.php';

    // Create an instance of the controller
    $controller_instance = new $controller();

    // Call the specified method
    $controller_instance->$action();
} else {
    // Handle 404 Not Found
    http_response_code(404);
    echo json_encode(['error' => 'Not Found']);
}
