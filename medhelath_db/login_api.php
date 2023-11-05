<?php

 require "config.php";

 if ($_SERVER['REQUEST_METHOD'] == "POST"){
   # Code...
  $response = array();
  $email = $_POST['email'];
  $password = md5($_POST['password']);

  $query_cek_user = mysqli_query($connection, "SELECT * FROM user WHERE email = '$email'");
  $cek_user_result = mysqli_fetch_array($query_cek_user);

 if ($cek_user_result){
    # code...

   $query_login = mysqli_query($connection,"SELECT * FROM user WHERE email = '$email' && password ='$password'");
   if ($query_login){ 
    # code...

    $response['value'] = 1;
    $response['message'] = "yeay, login es correcto. ";
    echo json_encode($response);
    

   } else {
    # code...
    $response['value'] = 2;
    $response['message'] = "oops, Error en login";
    echo json_encode($response);
}
 } else {
    # code...
    $response['value'] = 2;
    $response['message'] = "oops, data is not registered";
    echo json_encode($response);

   
   
 }

 }



?>