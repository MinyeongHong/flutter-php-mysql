<?php

    include 'php_connection.php';

        $query=$conn->query("SELECT * FROM netflix_contents");
        $result =array();

        while($rowData = $query->fetch_assoc()){
            $result[]=$rowData;
        }

        echo json_encode($result,JSON_UNESCAPED_UNICODE);