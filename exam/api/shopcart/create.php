<?php
// required headers
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

// 取得 request 內的資料
$data = json_decode(file_get_contents("php://input"));

// 確認資料內容
if (
    !empty($data->ProductName) &&
    !empty($data->UnitPrice) &&
    !empty($data->Quantity)&&
    !empty($data->Photo)
) {
    $shopcart->ProductName = $data->ProductName;
    $shopcart->UnitPrice = $data->UnitPrice;
    $shopcart->Quantity = $data->Quantity;
    $shopcart->Photo = $data->Photo;

    if ($shopcart->addItem()) {
        // 回傳成功訊息
        http_response_code(201);

        echo json_encode(["message" => "Shopcart added"]);
    } else {
        // 回傳 503 service unavailabe，新增失敗
        http_response_code(503);

        echo json_encode(["message"=> "Unable add Shopcart"]);
    }
} 
else {
    // 回傳 400 bad request，請求發送失敗
    http_response_code(400);

    echo json_encode(["message" => "Data is imcomplete"]);
}
