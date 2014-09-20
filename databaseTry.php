<?php

    include ('common/connection.php');

    $connection0 = new createConnection(); //i created a new object

    $connection0->connectToDatabase(); // connected to the database

    echo "<br />"; // putting a html break

    $connection0->selectDatabase();

    echo "<br />";

    $connection0->closeConnection();  // closed connection
?>