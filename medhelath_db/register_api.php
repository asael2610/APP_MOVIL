<?php

 require "config.php";

 if ($_SERVER['REQUEST_METHOD'] == "POST"){
   # Code...
  $response = array();
  $full_name = $_POST['fullname'];
  $email = $_POST['email'];
  $phone = $_POST['phone'];
  $address = $_POST['address'];
  $password = md5($_POST['password']);

  $query_cek_user = mysqli_query($connection, "SELECT * FROM user WHERE email = '$email' || phone = $phone");
  $cek_user_result = mysqli_fetch_array($query_cek_user);

 if ($cek_user_result){
    # code...

    $response['value'] = 0;
    $response['message'] = "Oops, lo siento los datos han sido registrados !";
    echo json_encode($response);

 }else {
    $query_insert_user = mysqli_query($connection, "INSERT INTO user VALUE('', '$full_name', '$email', '$phone', '$address', '$password', now(), 1)");

   if ($query_insert_user) {
    # code...

    $response['value'] = 1;
    $response['message'] = "yeay, Registro es correcto. Por favor inicia sesión con tu cuenta";
    echo json_encode($response);
    

   } else {
    # code...
    $response['value'] = 2;
    $response['message'] = "oops, Error en Registro";
    echo json_encode($response);

   }
   
 }

 }



?>