<?php
    require_once '../config.php';
	if(isset($_POST['product_id']) && isset($_POST['user_id']) && isset($_POST['description'])) {
		$product_id = $_POST['product_id'];
		$user_id = $_POST['user_id'];
		$description = $_POST['description'];

		$stmt = $conn->prepare("INSERT INTO reviews (product_id, user_id, description) VALUES (?, ?, ?)");
		$stmt->bind_param("iis", $product_id, $user_id, $description);
		$stmt->execute();

		if($stmt->affected_rows > 0) {
            //echo "<script>alert('Review saved successfully.');</script>";
		} else {
            //echo "<script>alert('Failed to save the review. Please try again later');</script>";
		}
		$stmt->close();
        header('Location: ' . $_SERVER['HTTP_REFERER']);
	} else {
        header('Location: ' . $_SERVER['HTTP_REFERER']);
	}
?>