<?php
$conn  = mysqli_connect("localhost", "root", "", "kulinernusantara");
$query = mysqli_query($conn, "SELECT * FROM user");
$data  = mysqli_fetch_all($query, MYSQLI_ASSOC);

echo json_encode($data);
