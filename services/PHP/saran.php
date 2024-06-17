<?php
$host = "localhost";
$username = "root";
$password = "";
$db = "kulinernusantara";

ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);
error_reporting(E_ALL);

ini_set('log_errors', 1);
ini_set('error_log', '/path_to_your_log_file/php_errors.log');

header('Content-Type: application/json');

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    $response = array(
        "status" => false,
        "message" => "Koneksi ke database gagal: " . $conn->connect_error
    );
    echo json_encode($response);
    exit();
}

if (isset($_POST['nama'], $_POST['email'], $_POST['saran'])) {
    $nama = htmlspecialchars($_POST['nama']);
    $email = htmlspecialchars($_POST['email']);
    $saran = htmlspecialchars($_POST['saran']);

    $stmt = $conn->prepare("INSERT INTO saran (nama, email, saran) VALUES (?, ?, ?)");
    if (!$stmt) {
        $response = array(
            "status" => false,
            "message" => "Gagal mempersiapkan statement: " . $conn->error
        );
        echo json_encode($response);
        exit();
    }

    $stmt->bind_param("sss", $nama, $email, $saran);

    if ($stmt->execute()) {
        $response = array(
            "status" => true,
            "message" => "Saran berhasil disimpan."
        );
    } else {
        $response = array(
            "status" => false,
            "message" => "Gagal menyimpan saran. Silakan coba lagi."
        );
    }

    $stmt->close();
    $conn->close();
} else {
    $response = array(
        "status" => false,
        "message" => "Data tidak lengkap. Pastikan nama, email, dan saran diisi."
    );
}

echo json_encode($response);
