<?php
session_start();
$_SESSION['matriculeUti'] = "";
header("Location: ../index.php");
?>