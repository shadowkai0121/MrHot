<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
include_once '../config/database.php';
include_once '../objects/shopcart.php';
 
$database = new Database();
$db = $database->getConnection();

$shopcart = new ShopCart($db);

$data = json_decode(file_get_contents("php://input"));

$shopcart->ProductName = $data->ProductName;

echo json_encode($data);
if ($shopcart->delete()) {
    http_response_code(200);
    
    echo json_encode(["message" => "Product was deleted."]);
} else {
    http_response_code(503);

    echo json_encode(["message" => "Unable to delete product."]);
}
