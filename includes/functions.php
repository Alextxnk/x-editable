<?php
include_once "config.php";

function get_url($page = ''){
   return HOST . "/$page";
}

function db(){
   try {
      return new PDO("mysql:host=" . DB_HOST . "; dbname=" . DB_NAME . "; charset=utf8", DB_USER, DB_PASS, [
		PDO::ATTR_EMULATE_PREPARES => false,
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
	]);
   } catch(PDOException $e){
      die($e->getMessage());
   } 
}

function db_query($sql = '', $exec = false){
   if (empty($sql)) return false;

   if($exec){
      return db()->exec($sql);
   }

	return db()->query($sql);
}


function get_user_info($login) {
   if (empty($login)) return [];

   return db_query("SELECT * FROM `users` WHERE login = '$login';")->fetch();
}

function login($auth_data) {
   if (empty($auth_data) || !isset($auth_data['login']) || empty($auth_data['login']) || !isset($auth_data['password']) || empty($auth_data['password'])) {
      $_SESSION['error'] = "Логин или пароль не может быть пустым";
      header('Location: index.php');
		die;
   }

   $user = get_user_info($auth_data['login']);
   if(empty($user)) {
      $_SESSION['error'] = "Логин или пароль не верен";
      header('Location: index.php');
		die;
   }

   if(password_verify($auth_data['password'], $user['password'])) {
      $_SESSION['user'] = $user;
      header('Location: profile.php');
		die;
   } else {
      $_SESSION['error'] = "Пароль не верен";
      header('Location: index.php');
		die;
   }
}


function add_employee($name, $email, $phone, $date, $address, $pasport, $inn) {
   return db_query("INSERT INTO `employees` (`name`, `email`, `phone`, `date`, `address`, `pasport`, `inn`) VALUES ('$name', '$email', '$phone', '$date', '$address', '$pasport', '$inn');", true);

}

function delete_employee($id) {
   if (empty($id)) return false;
   return db_query("DELETE FROM `employees` WHERE `employees`.`id` = $id;", true);
}

// function generate_string($size = 6) {
//    $new_string = str_shuffle(URL_CHARS);
//    return substr($new_string, 0, $size); 
// }