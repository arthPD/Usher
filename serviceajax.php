<?php

	require('rb.php');
	R::setup( 'mysql:host=localhost;dbname=db_ch2', 'root', '' );
	session_start();


	if(isset($_POST['start'])){
		if(is_numeric($_POST['servicenameorid'])){
			//call start function
			$service = R::load('services', $_POST['servicenameorid']);
			start($service);
		}else{
			//insert customservice first
			$service = R::dispense('services');
			$service->name = $_POST['servicenameorid'];
			$id = R::store($service);//$id=id of newly inserted//

			//call start function
			start($service);
		}
	}
	if(isset($_POST['searchone'])){
		$id = $_POST['id'];
		$member = R::load('members', $id);
		echo json_encode($member);
	}
	if(isset($_POST['addform'])){
		$name = $_POST['name'];
		$birthdate = $_POST['birthdate'];
		$address = $_POST['address'];
		$contact_no = $_POST['contact_no'];
		$note = $_POST['note'];

		$member = R::dispense('members');
		$member->name = $name;
		$member->birthdate = $birthdate;
		$member->address = $address;
		$member->contact_no = $contact_no;
		$member->note = $note;
		$id = R::store($member);
		echo json_encode($member);
	}
	function start($service){
		
		$startservice = R::dispense('attendance');
		$startservice->service_id = $service->id;
		$attendance = R::store($startservice);
		unset($_SESSION['started']);
		$_SESSION['started'] = $service->name;
		echo json_encode($service);
	}

?>