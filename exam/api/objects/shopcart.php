<?php
class ShopCart
{
    // 連線字串與資料表名稱
    private $conn;
    private $tableName = "shopcart";

    // 資料欄位
    public $CartID;
    public $Quantity;
    public $ProductName;
    public $UnitPrice;
    public $Photo;

    // 建構時取得連線字串
    public function __construct($db)
    {
        $this->conn = $db;
    }

    // 讀取
    public function read()
    {
        $query = "SELECT * FROM " . $this->tableName;
        
        $result = $this->conn->prepare($query);

        $result->execute();
        return $result;
    }

    // 新增
    public function addItem()
    {
        // 判斷是否已經在購物車內
        $checkString = "SELECT * FROM ". $this->tableName ." WHERE ProductName = '". $this->ProductName."'";
        $check = $this->conn->prepare($checkString);
        $check->execute();
        $row = $check->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $updateString = "UPDATE " . $this->tableName ."
                SET Quantity = ?
                WHERE ProductName = '" . $this->ProductName."'";
            $update = $this->conn->prepare($updateString);
            echo $this->Quantity."\r\n";
            echo $row["Quantity"]."\r\n";
            if ($row["Quantity"] >= $this->Quantity) {
                $row["Quantity"] += $this->Quantity;
            } else {
                $row["Quantity"] = $this->Quantity;
            }
            echo $row["Quantity"];
            $update->bindParam(1, $row["Quantity"]);
            $update->execute();
            return true;
        }

        $query = "INSERT INTO " . $this->tableName . "
            (ProductName, UnitPrice, Photo, Quantity)
            VALUES (:ProductName, :UnitPrice, :Photo, :Quantity);";

        $result = $this->conn->prepare($query);

        $this->ProductName = htmlspecialchars(strip_tags($this->ProductName));
        $this->UnitPrice = htmlspecialchars(strip_tags($this->UnitPrice));
        $this->Quantity = htmlspecialchars(strip_tags($this->Quantity));
        $this->Photo = htmlspecialchars(strip_tags($this->Photo));

        $result->bindParam(":ProductName", $this->ProductName);
        $result->bindParam(":UnitPrice", $this->UnitPrice);
        $result->bindParam(":Quantity", $this->Quantity);
        $result->bindParam(":Photo", $this->Photo);

        if ($result->execute()) {
            return true;
        }
        return false;
    }

    // 修改
    public function Delete()
    {
        $query = "DELETE FROM " . $this->tableName . "
            Where ProductName = :ProductName";
        
        $result = $this->conn->prepare($query);

        $this->ProductName = htmlspecialchars(strip_tags($this->ProductName));

        $result->bindParam(":ProductName", $this->ProductName);

        if ($result->execute()) {
            return true;
        }

        return false;
    }
}
