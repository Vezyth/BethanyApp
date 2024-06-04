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
        		    FROM tb_doa
        		    WHERE Full_Name = ?"
        	);
        	$result->execute([$Phone_Number]);
        	if (($row = $result->fetch(PDO::FETCH_ASSOC)) !== false) {
        		$response["success"] = 0;
        	    $response["message"] = "permintaan sudah terdaftar !";
        	} else {
        		$result = $con->prepare(
    				"INSERT INTO tb_doa(Full_Name, Phone_Number, Born_Date, gender, Category_ID, Prayer_Detail, bersedia_dihubungi) 
    					VALUES(?, ?, ?, ?, ?, ?, ?)"
    			);
    			if ($result->execute([$nama_lengkap, $Phone_Number,$Born_Date,$gender,$Category_ID,$Prayer_Detail,$bersedia_dihubungi])) {
    				$response["success"] = 1;
        	        $response["message"] = "Success.";
    			}
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