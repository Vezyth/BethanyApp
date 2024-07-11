<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Content-Type: application/json; charset=UTF-8");

$response = array();
try {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if (isset($_POST["Full_Name"]) && isset($_POST["Phone_Number"]) && isset($_POST["Born_Date"]) && isset($_POST["Email"]) && isset($_POST["Password"]) && isset($_POST["Gender"]) && isset($_POST["Created_By"])) {
            $Full_Name = $_POST["Full_Name"];
            $Phone_Number = $_POST["Phone_Number"];
            $Born_Date = $_POST["Born_Date"];
            $Email = $_POST["Email"];
            $Password = $_POST["Password"];
            $Gender = $_POST["Gender"];
            $Created_By = $_POST["Created_By"];
            
            require_once("db_connect.php");
            
            // Check if user already exists
            $query = "SELECT Full_Name FROM Master_User WHERE Full_Name = ?";
            $result = $con->prepare($query);
            $result->execute([$Full_Name]);
            if (($row = $result->fetch(PDO::FETCH_ASSOC)) !== false) {
                $response["success"] = 0;
                $response["message"] = "Anda sudah terdaftar !";
            } else {
                // Insert new user
                $query = "INSERT INTO Master_User (Full_Name, Phone_Number, Born_Date, Email, Password, Gender, Created_By) VALUES (?, ?, ?, ?, ?, ?, ?)";
                $result = $con->prepare($query);
                if ($result->execute([$Full_Name, $Phone_Number, $Born_Date, $Email, $Password, $Gender, $Created_By])) {
                    $response["success"] = 1;
                    $response["message"] = "Success.";
                } else {
                    $response["success"] = 0;
                    $response["message"] = "User registration failed.";
                }
            }
        } else {
            $response["success"] = 0;
            $response["message"] = "Invalid request.";
        }
    } else {
        $response["success"] = 0;
        $response["message"] = "Invalid request.";
    }
} catch (PDOException $e) {
    $response["success"] = 0;
    $response["message"] = "Error: " . $e->getMessage();
}

echo json_encode($response);
?>
