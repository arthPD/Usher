<?php  

	require('rb.php');
	R::setup( 'mysql:host=localhost;dbname=db_ch2', 'root', '' );
	session_start();

	if(isset($_GET['searchfunction'])){
		$searchtext = $_GET['searchtext'];
		$member = R::getAll( 'select * from members where name LIKE :name', array(':name'=> '%'.$searchtext.'%') );
		echo json_encode($member);
	}

	elseif(isset($_POST['addform'])){
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
		getall();
	}

	elseif(isset($_POST['delete'])){
		$id = $_POST['id'];
		$member = R::load('members', $id);
		R::trash($member);
		getall();

	}
	elseif(isset($_POST['editform'])){
		$id = $_POST['id'];
		$name = $_POST['name'];
		$birthdate = $_POST['birthdate'];
		$address = $_POST['address'];
		$contact_no = $_POST['contact_no'];
		$note = $_POST['note'];

		$member = R::load('members', $id);
		$member->name = $name;
		$member->birthdate = $birthdate;
		$member->address = $address;
		$member->contact_no = $contact_no;
		$member->note = $note;
		$id = R::store($member);
		getall();
	}

	function getall(){
		$members = R::findAll('members');
		echo json_encode($members);
	}
?>