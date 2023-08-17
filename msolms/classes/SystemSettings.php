<?php
if(!class_exists('DBConnection')){
	require_once('../config.php');
	require_once('DBConnection.php');
}
class SystemSettings extends DBConnection{
	public function __construct(){
		parent::__construct();
	}
	function check_connection(){
		return($this->conn);
	}
	function load_system_info(){
		// if(!isset($_SESSION['system_info'])){
			$sql = "SELECT * FROM system_info";
			$qry = $this->conn->query($sql);
				while($row = $qry->fetch_assoc()){
					$_SESSION['system_info'][$row['meta_field']] = $row['meta_value'];
				}
		// }
	}
	function update_system_info(){
		$sql = "SELECT * FROM system_info";
		$qry = $this->conn->query($sql);
			while($row = $qry->fetch_assoc()){
				if(isset($_SESSION['system_info'][$row['meta_field']]))unset($_SESSION['system_info'][$row['meta_field']]);
				$_SESSION['system_info'][$row['meta_field']] = $row['meta_value'];
			}
		return true;
	}
	function update_settings_info()
{
    $resp = array(); // Initialize the response array

    foreach ($_POST as $key => $value) {
        if ($key !== "content") {
            if (isset($_SESSION['system_info'][$key])) {
                $value = str_replace("'", "&apos;", $value);
                $qry = $this->conn->query("UPDATE system_info SET meta_value = '{$value}' WHERE meta_field = '{$key}'");
            } else {
                $qry = $this->conn->query("INSERT INTO system_info (meta_value, meta_field) VALUES ('{$value}', '{$key}')");
            }
        }
    }

    if (isset($_POST['content'])) {
        foreach ($_POST['content'] as $k => $v) {
            file_put_contents("../{$k}.html", $v);
        }
    }

    if (isset($_FILES['img']) && $_FILES['img']['tmp_name'] !== '') {
        $fname = 'uploads/logo-' . time() . '.png';
        $dir_path = base_app . $fname;
        $upload = $_FILES['img']['tmp_name'];
        $type = mime_content_type($upload);
        $allowed = array('image/png', 'image/jpeg');
        if (!in_array($type, $allowed)) {
            $resp['msg'] .= " But Image failed to upload due to an invalid file type.";
        } else {
            if (!is_dir(base_app . "uploads")) {
                mkdir(base_app . "uploads");
            }
            $file_ext = strtolower(pathinfo($_FILES['img']['name'], PATHINFO_EXTENSION));
            $unique_filename = time() . '_' . uniqid() . '.' . $file_ext;
            $fname = 'uploads/' . $unique_filename;
            $dir_path = base_app . $fname;
            $upload = $_FILES['img']['tmp_name'];
            $type = mime_content_type($upload);
            $allowed = array('image/png', 'image/jpeg');
            if (!in_array($type, $allowed)) {
                $resp['msg'] .= " But Image failed to upload due to an invalid file type.";
            } else {
                if (move_uploaded_file($upload, $dir_path)) {
                    $qry = $this->conn->query("UPDATE system_info SET meta_value = CONCAT('{$fname}','?v=',UNIX_TIMESTAMP(CURRENT_TIMESTAMP)) WHERE meta_field = 'logo'");
                } else {
                    $resp['msg'] .= " But Image failed to upload due to an unknown reason.";
                }
            }
        }
    }

    if (isset($_FILES['cover']) && $_FILES['cover']['tmp_name'] !== '') {
        $fname = 'uploads/cover-' . time() . '.png';
        $dir_path = base_app . $fname;
        $upload = $_FILES['cover']['tmp_name'];
        $type = mime_content_type($upload);
        $allowed = array('image/png', 'image/jpeg');
        if (!in_array($type, $allowed)) {
            $resp['msg'] .= " But Image failed to upload due to an invalid file type.";
        } else {
            if (!is_dir(base_app . "uploads")) {
                mkdir(base_app . "uploads");
            }
            $file_ext = strtolower(pathinfo($_FILES['cover']['name'], PATHINFO_EXTENSION));
            $unique_filename = time() . '_' . uniqid() . '.' . $file_ext;
            $fname = 'uploads/' . $unique_filename;
            $dir_path = base_app . $fname;
            $upload = $_FILES['cover']['tmp_name'];
            $type = mime_content_type($upload);
            $allowed = array('image/png', 'image/jpeg');
            if (!in_array($type, $allowed)) {
                $resp['msg'] .= " But Image failed to upload due to an invalid file type.";
            } else {
                if (move_uploaded_file($upload, $dir_path)) {
                    $qry = $this->conn->query("UPDATE system_info SET meta_value = '{$fname}' WHERE meta_field = 'cover'");
                } else {
                    $resp['msg'] .= " But Image failed to upload due to an unknown reason.";
                }
            }
        }
    }

    $update = $this->update_system_info();
    $flash = $this->set_flashdata('success', 'System Info Successfully Updated.');
    if ($update && $flash) {
        return true;
    } else {
        return false;
    }
}

	function set_userdata($field='',$value=''){
		if(!empty($field) && !empty($value)){
			$_SESSION['userdata'][$field]= $value;
		}
	}
	function userdata($field = ''){
		if(!empty($field)){
			if(isset($_SESSION['userdata'][$field]))
				return $_SESSION['userdata'][$field];
			else
				return null;
		}else{
			return false;
		}
	}
	function set_flashdata($flash='',$value=''){
		if(!empty($flash) && !empty($value)){
			$_SESSION['flashdata'][$flash]= $value;
		return true;
		}
	}
	function chk_flashdata($flash = ''){
		if(isset($_SESSION['flashdata'][$flash])){
			return true;
		}else{
			return false;
		}
	}
	function flashdata($flash = ''){
		if(!empty($flash)){
			$_tmp = $_SESSION['flashdata'][$flash];
			unset($_SESSION['flashdata']);
			return $_tmp;
		}else{
			return false;
		}
	}
	function sess_des(){
		if(isset($_SESSION['userdata'])){
				unset($_SESSION['userdata']);
			return true;
		}
			return true;
	}
	function info($field=''){
		if(!empty($field)){
			if(isset($_SESSION['system_info'][$field]))
				return $_SESSION['system_info'][$field];
			else
				return false;
		}else{
			return false;
		}
	}
	function set_info($field='',$value=''){
		if(!empty($field) && !empty($value)){
			$_SESSION['system_info'][$field] = $value;
		}
	}
}
$_settings = new SystemSettings();
$_settings->load_system_info();
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$sysset = new SystemSettings();
switch ($action) {
	case 'update_settings':
		echo $sysset->update_settings_info();
		break;
	default:
		// echo $sysset->index();
		break;
}
?>