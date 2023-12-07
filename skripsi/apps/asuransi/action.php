<?php
session_start();
include "../../modules/config.php";
include "../../modules/connect.php";
include "../../modules/library.php";
include "../components/auth.php";

if(isset($_POST['insert'])){
	if(empty($_POST['pengguna'])){
		alert('Nama Asuransi Harus diisi');
	} else {		
		$sql = "INSERT INTO `riwayat` (`id__asuransi`,`pengguna`)
			VALUES (NULL, '{$_POST['pengguna']}')";
		$query = query($sql);
	}	
} else if(isset($_POST['update'])){
	if(empty($_POST['pengguna'])){
		alert('Nama Asuransi Harus diisi');
	} else {
		$id = $_POST['id_asuransi'];

		$sql = "UPDATE `riwayat` SET `pengguna` = '{$_POST['pengguna']}' WHERE `id_asuransi` =  '$id'";
		$query = query($sql);
	}	
} else if(isset($_POST['delete'])){
	$id = $_POST['id_asuransi'];

	#cek asuransi
	$sql = "SELCT COUNT(*) as numOfUsed FROM asuransi WHERE id_asuransi='$id'";
	$query = query($sql);
	$data = mysqli_fetch_array($query);

	if($data['numOfUsed'] > 0){
		alert('Asuransi ini tidak dapat dihapus!');
	} else {
		$sql = "DELETE FROM `riwayat` WHERE `id_asuransi` = '$id'";
		$query = query($sql);
	}
}

if($query){
	header ("Location:".APPURL.'/'.basename(__DIR__));
}
?>
