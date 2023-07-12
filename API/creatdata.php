<?php
require_once 'connection.php';

if ($conn) {
    $nama = $_POST['nama'];
    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "INSERT INTO users(nama, username, password) VALUES('$nama', '$username', '$password')";


    if ($nama != "" && $username != "" && $password != "") {
        $result = mysqli_query($conn, $query);
        $response = array();

        if ($result) {
            array_push($response, array(
                'status' => 'OK'
            ));
        } else {
            array_push($response, array(
                'status' => 'FAILED'
            ));
        }
    } else {
        array_push($response, array(
            'status' => 'FAILED'
        ));
    }
} else {
    array_push($response, array(
        'status' => 'FAILED'
    ));
}

echo json_encode(array("server_response" => $response));
mysqli_close($conn);
