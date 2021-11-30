<?php

    $servername ='localhost';
    $username ='root';
    $password = '';
    $dbname = 'testdb';

    $conn = new mysqli($servername,$username,$password,$dbname);


    if($conn->connect_error){
        printf("Connection Failed:" . $conn->connect_error);
        exit();
    }
   // else printf("Connection 성공");

?>