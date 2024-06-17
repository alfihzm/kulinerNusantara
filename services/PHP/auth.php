<?php
include('connection.php');

$email = $_POST['email'];
$password = $_POST['password'];

$email = stripcslashes($email);
$password = stripcslashes($password);
$email = mysqli_real_escape_string($conn, $email);
$password = mysqli_real_escape_string($conn, $password);

$query = "SELECT * FROM user WHERE email = '$email' AND password = '$password'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
$count = mysqli_num_rows($result);

$response = array();

if ($count == 1) {
    $response['success'] = true;
    $response['message'] = "Login successful";
    $response['nama'] = $row['nama'];
} else {
    $response['success'] = false;
    $response['message'] = "Invalid email or password";
}

echo json_encode($response);