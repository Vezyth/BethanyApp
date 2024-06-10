<?php
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods: GET, OPTIONS");
    $response = array();
    try {
    	if (isset($_POST["Bride_Name"]) && isset($_POST["Groom_Name"])   ) {
    		$Groom_Name = $_POST["Groom_Name"];
    		$Groom_Address = $_POST["Groom_Address"];
			$Groom_Phone_Number = $_POST["Groom_Phone_Number"];
            $Groom_Home_Number = $_POST["Groom_Home_Number"];
            $Groom_Born_Place =$_POST["Groom_Born_Place"];
            $Groom_Born_Date = $_POST["Groom_Born_Date"];
			$Groom_Father = $_POST["Groom_Father"];
            $Groom_Mother = $_POST["Groom_Mother"];
			$Bride_Name = $_POST["Bride_Name"];
    		$Bride_Address = $_POST["Bride_Address"];
			$Bride_Phone_Number = $_POST["Bride_Phone_Number"];
            $Bride_Home_Number = $_POST["Bride_Home_Number"];
            $Bride_Born_Place =$_POST["Bride_Born_Place"];
            $Bride_Born_Date = $_POST["Bride_Born_Date"];
			$Bride_Father = $_POST["Bride_Father"];
            $Bride_Mother = $_POST["Bride_Mother"];
			$Blessing_Date = $_POST["Blessing_Date"];
			$Address_After_Married = $_POST["Address_After_Married"];
			$Phone_After_Married = $_POST["Phone_After_Married"];
			$BrideGroom_Approval = $_POST["BrideGroom_Approval"];

			
            
    		
    		require_once("db_connect.php");
    		$result = $con->prepare(
        		"SELECT Groom_Name 
        		    FROM Marriage
        		    WHERE Groom_Name = ?"
        	);
        	$result->execute([$Groom_Name]);
        	if (($row = $result->fetch(PDO::FETCH_ASSOC)) !== false) {
        		$response["success"] = 0;
        	    $response["message"] = "Anda sudah terdaftar !";
        	} else {
        		$result = $con->prepare(
    				"INSERT INTO Marriage(
					Groom_Name, 
					Groom_Address, 
					Groom_Phone_Number, 
					Groom_Home_Number,
					Groom_Born_Place, 
					Groom_Born_Date, 
					Groom_Father, 
					Groom_Mother, 
					Bride_Name, 
					Bride_Address, 
					Bride_Phone_Number, 
					bride_Home_Number,
					Bride_Born_Place,
					Bride_Born_Date, 
					Bride_Father, 
					Bride_Mother,
					Blessing_Date,
					Address_After_Married,
					Phone_After_Married,
					BrideGroom_Approval) 
    					VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
    			);
    			if ($result->execute([$Groom_Name, $Groom_Address, $Groom_Phone_Number,$Groom_Home_Number, $Groom_Born_Place, $Groom_Born_Date, $Groom_Father, $Groom_Mother, $Bride_Name, $Bride_Address, $Bride_Phone_Number,$Bride_Home_Number, $Bride_Born_Place, $Bride_Born_Date, $Bride_Father, $Bride_Mother,$Blessing_Date,$Address_After_Married,$Phone_After_Married,$BrideGroom_Approval,$])) {
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