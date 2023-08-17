<?php
require_once('../config.php');
Class Users extends DBConnection {
	private $settings;
	public function __construct(){
		global $_settings;
		$this->settings = $_settings;
		parent::__construct();
	}
	public function __destruct(){
		parent::__destruct();
	}

	public function save_admins()
	{
		extract($_POST);
		$data = '';
		$chk = $this->conn->query("SELECT * FROM `admins` WHERE username ='{$username}' " . ($id > 0 ? " AND id != '{$id}' " : ""))->num_rows;
		if ($chk > 0) {
			return 3;
			exit;
		}
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id', 'password'))) {
				if (!empty($data)) {
					$data .= " , ";
				}
				$data .= " {$k} = '{$v}' ";
			}
		}
		if (!empty($password)) {
			$password = md5($password);
			if (!empty($data)) {
				$data .= " , ";
			}
			$data .= " `password` = '{$password}' ";
		}

		
		$qry = $this->conn->query("UPDATE admins SET $data WHERE id = {$id}");
		if ($qry) {
			$this->settings->set_flashdata('success', 'User details successfully updated.');
			foreach ($_POST as $k => $v) {
				if ($k != 'id') {
					if (!empty($data)) {
						$data .= " , ";
					}
					$this->settings->set_userdata($k, $v);
				}
			}
			if (isset($_FILES['img']) && $_FILES['img']['tmp_name'] != '') {
				if (!is_dir(base_app . "uploads/admins")) {
					mkdir(base_app . "uploads/admins");
				}
				$extension = pathinfo($_FILES['img']['name'], PATHINFO_EXTENSION);
				$uniqueFilename = uniqid() . '.' . $extension;
				$fname = 'uploads/admins/' . $uniqueFilename;
				$dir_path = base_app . $fname;
				$upload = $_FILES['img']['tmp_name'];
				$type = mime_content_type($upload);
				$allowed = array('image/png', 'image/jpeg','image/jpg');
				if (!in_array($type, $allowed)) {
					$resp['msg'] .= " But Image failed to upload due to an invalid file type.";
				} else {
					if (move_uploaded_file($upload, $dir_path)) {
						$qry = $this->conn->query("UPDATE `admins` SET avatar = CONCAT('{$fname}','?v=',UNIX_TIMESTAMP(CURRENT_TIMESTAMP)) WHERE id = '$id'");
						if ($this->settings->userdata('id') == $id && $this->settings->userdata('login_type') == 2) {
							$this->settings->set_userdata('avatar', $fname . "?v=" . time());
						}
					} else {
						$resp['msg'] .= " But Image failed to upload due to an unknown reason.";
					}
				}
			}
			return 1;
		} else {
			return "UPDATE admins SET $data WHERE id = {$id}";
		}
	}

	public function save_seller()
	{
		if (!empty($_POST['password'])) {
			$_POST['password'] = md5($_POST['password']);
		} else {
			unset($_POST['password']);
		}

		if (empty($_POST['id'])) {
			$prefix = date('Ym-');
			$code = sprintf("%'.05d", 1);
			while (true) {
				$check = $this->conn->query("SELECT * FROM `seller_list` WHERE code = '{$prefix}{$code}'")->num_rows;
				if ($check > 0) {
					$code = sprintf("%'.05d", ceil($code) + 1);
				} else {
					break;
				}
			}
			$_POST['code'] = $prefix . $code;
		}

		extract($_POST);

		if (isset($oldpassword) && !empty($id)) {
			$current_pass = $this->conn->query("SELECT * FROM `seller_list` WHERE id = '{$id}'")->fetch_array()['password'];
			if (md5($oldpassword) != $current_pass) {
				$resp['status'] = 'failed';
				$resp['msg'] = 'Incorrect Current Password';
				return json_encode($resp);
				exit;
			}
		}

		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, ['id', 'cpassword', 'oldpassword']) && !is_array($_POST[$k])) {
				$v = $this->conn->real_escape_string($v);
				if (!empty($data)) {
					$data .= ", ";
				}
				$data .= "`{$k}`='{$v}'";
			}
		}

		$check = $this->conn->query("SELECT * FROM `seller_list` WHERE username = '{$username}' AND delete_flag = 0 " . (!empty($id) ? "AND id != '{$id}'" : ''))->num_rows;
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "Username already exists";
		} else {
			if (empty($id)) {
				$sql = "INSERT INTO `seller_list` SET {$data}";
			} else {
				$sql = "UPDATE `seller_list` SET {$data} WHERE id = '{$id}'";
			}
			$save = $this->conn->query($sql);
			if ($save) {
				$resp['status'] = "success";
				$vid = empty($id) ? $this->conn->insert_id : $id;
				if (empty($id)) {
					if (strpos($_SERVER['HTTP_REFERER'], 'seller/register.php') > -1) {
						$resp['msg'] = "Your account has been registered successfully.";
					} else {
						$resp['msg'] = "Seller's Account has been registered successfully.";
					}
				} else {
					if ($this->settings->userdata('login_type') == 2) {
						$resp['msg'] = "Your account details have been updated successfully.";
					} else {
						$resp['msg'] = "Seller's Account Details have been updated successfully.";
					}
				}

				if (isset($_FILES['img']) && $_FILES['img']['tmp_name'] != '') {
					if (!is_dir(base_app . "uploads/sellers")) {
						mkdir(base_app . "uploads/sellers");
					}
					$extension = pathinfo($_FILES['img']['name'], PATHINFO_EXTENSION);
					$uniqueFilename = uniqid() . '.' . $extension;
					$fname = 'uploads/sellers/' . $uniqueFilename;
					$dir_path = base_app . $fname;
					$upload = $_FILES['img']['tmp_name'];
					$type = mime_content_type($upload);
					$allowed = array('image/png', 'image/jpeg','image/jpg');
					if (!in_array($type, $allowed)) {
						$resp['msg'] .= " But Image failed to upload due to an invalid file type.";
					} else {
						if (move_uploaded_file($upload, $dir_path)) {
							$qry = $this->conn->query("UPDATE `seller_list` SET avatar = CONCAT('{$fname}','?v=',UNIX_TIMESTAMP(CURRENT_TIMESTAMP)) WHERE id = '$vid'");
							if ($this->settings->userdata('id') == $id && $this->settings->userdata('login_type') == 2) {
								$this->settings->set_userdata('avatar', $fname . "?v=" . time());
							}
						} else {
							$resp['msg'] .= " But Image failed to upload due to an unknown reason.";
						}
					}
				}
			} else {
				$resp['status'] = 'failed';
				$resp['msg'] = "An error occurred while saving the account details.";
				$resp['error'] = $this->conn->error;
			}
		}

		if ($resp['status'] == 'success') {
			$this->settings->set_flashdata('success', $resp['msg']);
		}

		return json_encode($resp);
	}

	public function delete_seller(){
		extract($_POST);
		$qry = $this->conn->query("UPDATE seller_list set delete_flag = 1 where id = $id");
		if($qry){
			$this->settings->set_flashdata('success',' Seller Details successfully deleted.');
			$resp['status'] = 'success';
		}else{
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured while deleting the data.';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}

	public function save_user()
	{
		if (!empty($_POST['password']))
			$_POST['password'] = md5($_POST['password']);
		else
			unset($_POST['password']);

		if (empty($_POST['id'])) {
			$prefix = date('Ym-');
			$code = sprintf("%'.05d", 1);
			while (true) {
				$check = $this->conn->query("SELECT * FROM `user_list` WHERE code = '{$prefix}{$code}'")->num_rows;
				if ($check > 0) {
					$code = sprintf("%'.05d", ceil($code) + 1);
				} else {
					break;
				}
			}
			$_POST['code'] = $prefix . $code;
		}

		extract($_POST);

		if (isset($oldpassword) && !empty($id)) {
			$current_pass = $this->conn->query("SELECT * FROM `user_list` WHERE id = '{$id}'")->fetch_array()['password'];
			if (md5($oldpassword) != $current_pass) {
				$resp['status'] = 'failed';
				$resp['msg'] = 'Incorrect Current Password';
				return json_encode($resp);
				exit;
			}
		}

		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, ['id', 'cpassword', 'oldpassword']) && !is_array($_POST[$k])) {
				$v = $this->conn->real_escape_string($v);
				if (!empty($data))
					$data .= ", ";
				$data .= "`{$k}`='{$v}'";
			}
		}

		$check = $this->conn->query("SELECT * FROM `user_list` WHERE email = '{$email}' AND delete_flag = 0 " . (!empty($id) ? "AND id != '{$id}'" : ''))->num_rows;
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "Email already exists";
		} else {
			if (empty($id)) {
				$sql = "INSERT INTO `user_list` SET {$data}";
			} else {
				$sql = "UPDATE `user_list` SET {$data} WHERE id = '{$id}'";
			}
			$save = $this->conn->query($sql);
			if ($save) {
				$resp['status'] = "success";
				$vid = empty($id) ? $this->conn->insert_id : $id;
				if (empty($id)) {
					if (strpos($_SERVER['HTTP_REFERER'], 'register.php') > -1) {
						$resp['msg'] = "Your account has been registered successfully.";
					} else {
						$resp['msg'] = "Client's Account has been registered successfully.";
					}
				} else {
					if ($this->settings->userdata('login_type') == 3) {
						$resp['msg'] = "Your account details have been updated successfully.";
					} else {
						$resp['msg'] = "Client's Account Details have been updated successfully.";
					}
				}

				if (isset($_FILES['img']) && $_FILES['img']['tmp_name'] != '') {
					if (!is_dir(base_app . "uploads/users")) {
						mkdir(base_app . "uploads/users");
					}
					$extension = pathinfo($_FILES['img']['name'], PATHINFO_EXTENSION);
					$uniqueFilename = uniqid() . '.' . $extension;
					$fname = 'uploads/users/' . $uniqueFilename;
					$dir_path = base_app . $fname;
					$upload = $_FILES['img']['tmp_name'];
					$type = mime_content_type($upload);
					$allowed = array('image/png', 'image/jpeg','image/jpg');
					if (!in_array($type, $allowed)) {
						$resp['msg'] .= " But Image failed to upload due to an invalid file type.";
					} else {
						if (move_uploaded_file($upload, $dir_path)) {
							$qry = $this->conn->query("UPDATE `user_list` SET avatar = CONCAT('{$fname}','?v=',UNIX_TIMESTAMP(CURRENT_TIMESTAMP)) WHERE id = '$vid'");
							if ($this->settings->userdata('id') == $id && $this->settings->userdata('login_type') == 2) {
								$this->settings->set_userdata('avatar', $fname . "?v=" . (time()));
							}
						} else {
							$resp['msg'] .= " But Image failed to upload due to an unknown reason.";
						}
					}
				}
			} else {
				$resp['status'] = 'failed';
				$resp['msg'] = "An error occurred while saving the account details.";
				$resp['error'] = $this->conn->error;
			}
		}

		if ($resp['status'] == 'success') {
			$this->settings->set_flashdata('success', $resp['msg']);
		}

		return json_encode($resp);
	}

	public function delete_user(){
		extract($_POST);
		$qry = $this->conn->query("UPDATE user_list set delete_flag = 1 where id = $id");
		if($qry){
			$this->settings->set_flashdata('success',' Client Details successfully deleted.');
			$resp['status'] = 'success';
		}else{
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured while deleting the data.';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
}

$users = new users();
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
switch ($action) {
	case 'save_admins':
		echo $users->save_admins();
	break;
	case 'save_seller':
		echo $users->save_seller();
	break;
	case 'delete_seller':
		echo $users->delete_seller();
	break;
	case 'save_user':
		echo $users->save_user();
	break;
	case 'delete_user':
		echo $users->delete_user();
	default:
		// echo $sysset->index();
		break;
}