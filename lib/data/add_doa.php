<?php
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods: GET, OPTIONS");
    $response = array();
    try {
    	if (isset($_POST["NIJ"]) && isset($_POST["Password"])) {
    		$NIJ = $_POST["NIJ"];
    		
			$Password = $_POST["Password"];
			
    		
    		require_once("db_connect.php");
    		$result = $con->prepare(
        		"SELECT * 
        		    FROM Master_User 
        		    WHERE NIJ = ? AND Password = ?"
        	);
        	$result->execute([$NIJ, $Password]);
        	if (($row = $result->fetch(PDO::FETCH_ASSOC)) !== false) {
        		$response["success"] = 0;
        	    $response["message"] = "Anda sudah terdaftar !";
        	} else {
        		$response["success"] = 0;
        		$response["message"] = "NIJ atau Password Salah";
        	}
    	} else {
        	$response["success"] = 0;
        	$response["message"] = "Error.";
    	}
    } catch (PDOException $e) {
    	$response["success"] = 0;
    	$response["message"] = "Error.";
    }
    echo json_encode($response);
?>