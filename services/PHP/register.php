<?php
include('connection.php');

$nama = $_POST['nama'];
$email = $_POST['email'];
$password = $_POST['password'];

$stmt = $conn->prepare("SELECT * FROM user WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    echo json_encode(["success" => false, "message" => "Email sudah terdaftar"]);
} else {
    $stmt = $conn->prepare("INSERT INTO user (nama, email, password) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $nama, $email, $password);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Registrasi berhasil"]);
    } else {
        echo json_encode(["success" => false, "message" => "Registrasi gagal"]);
    }
}

$stmt->close();
$conn->close();
