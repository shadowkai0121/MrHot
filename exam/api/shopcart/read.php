<?php
// headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// 引用資料庫與shopcart物件
include_once '../config/database.php';
include_once '../objects/shopcart.php';

// 建立資料庫實體並取得連線字串
$database = new Database();
$db = $database->getConnection();

// 建立 shopcart 實體
$shopcart = new ShopCart($db);
// 查詢內容
$result = $shopcart->read();
$count = $result->rowCount();

// 確認有取得資料
if ($count > 0){
    // 購物車內容
    $shopcartList = [];
    while ($row = $result->fetch(PDO::FETCH_ASSOC)){
        // 將 $row['name'] 轉換成 $name
        extract($row);

        $shopcartItem = [
            "CartID" => $CartID,
            "ProductName" => $ProductName,
            "UnitPrice" => $UnitPrice,
            "Quantity" => $Quantity,
            "Photo" => $Photo
        ];

        array_push($shopcartList, $shopcartItem);        
    }

        // 回傳成功訊息
        http_response_code(200);
 
        // 回傳資料內容
        echo json_encode($shopcartList);
}
else{
     
    // set response code - 404 Not found
    http_response_code(404);
 
    // 錯誤訊息
    echo json_encode(
        array("message" => "No products found.")
    );
}
?>