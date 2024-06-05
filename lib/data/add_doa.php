<?php
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods: GET, OPTIONS");
    $response = array();
    try {
    	if (isset($_POST["Full_Name"]) && isset($_POST["Phone_Number"])) {
    		$Full_Name = $_POST["Full_Name"];
    		$Phone_Number = $_POST["Phone_Number"];
			$Born_Date = $_POST["Born_Date"];
            $Gender = $_POST["Gender"];
            $Category_ID =$_POST["Category_ID"];
            $Prayer_Detail = $_POST["Prayer_Detail"];
            $Visit = $_POST["Visit"];
            
    		
    		require_once("db_connect.php");
    		$result = $con->prepare(
        		"SELECT Full_Name 
        		    FROM Prayer
        		    WHERE Full_Name = ?"
        	);
        	$result->execute([$Full_Name]);
        	if (($row = $result->fetch(PDO::FETCH_ASSOC)) !== false) {
        		$response["success"] = 0;
        	    $response["message"] = "permintaan sudah terdaftar !";
        	} else {
        		$result = $con->prepare(
    				"INSERT INTO Prayer(Full_Name, Phone_Number, Born_Date, Gender, Category_ID, Prayer_Detail, Visit) 
    					VALUES(?, ?, ?, ?, ?, ?, ?)"
    			);
    			if ($result->execute([$Full_Name, $Phone_Number,$Born_Date,$Gender,$Category_ID,$Prayer_Detail,$Visit])) {
    				$response["success"] = 1;
        	        $response["message"] = "Success.";
    			}
        	}
    	} else {
        	$response["success"] = 0;
        	$response["message"] = "Error.1";
    	}
    } catch (PDOException $e) {
    	$response["success"] = 0;
    	$response["message"] = "Error.".$e;
    }
    echo json_encode($response);
?>