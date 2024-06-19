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
        		"SELECT NIJ 
        		    FROM Master_User 
        		    WHERE NIJ = $NIJ"
        	);
        	$result->execute([$NIJ]);
        	if (($row = $result->fetch(PDO::FETCH_ASSOC)) !== false) {
        		$response["success"] = 1;
        	    $response["message"] = "Success";
        	} 
    	} else {
        	$response["success"] = 0;
        	$response["message"] = "Wrong NIJ or Password !";
    	}
    } catch (PDOException $e) {
    	$response["success"] = 0;
    	$response["message"] = "Error.";
    }
    echo json_encode($response);
?>