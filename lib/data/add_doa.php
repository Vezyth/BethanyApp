<?php
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods: GET, OPTIONS");
    $response = array();
    try {
    	if (isset($_POST["nama_lengkap"]) && isset($_POST["nomor_handphone"])) {
    		$nama_lengkap = $_POST["nama_lengkap"];
    		$nomor_handphone = $_POST["nomor_handphone"];
			$umur = $_POST["umur"];
            $gender = $_POST["gender"];
            $kategori =$_POST["kategori"]
            $permintaan_khusus = $_POST["permintaan_khusus"];
            $bersedia_dihubungi = $_POST["bersedia_dihubungi"];
            
    		
    		require_once("db_connect.php");
    		$result = $con->prepare(
        		"SELECT nomor_handphone 
        		    FROM tb_user 
        		    WHERE nomor_handphone = ?"
        	);
        	$result->execute([$nomor_handphone]);
        	if (($row = $result->fetch(PDO::FETCH_ASSOC)) !== false) {
        		$response["success"] = 0;
        	    $response["message"] = "nomor_handphone sudah terdaftar !";
        	} else {
        		$result = $con->prepare(
    				"INSERT INTO tb_user(nama_lengkap, nomor_handphone, umur, gender, kategori, permintaan_khusus, bersedia_dihubungi) 
    					VALUES(?, ?, ?)"
    			);
    			if ($result->execute([$nama_lengkap, $nomor_handphone,$umur,$gender,$kategori,$permintaan_khusus,$bersedia_dihubungi])) {
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