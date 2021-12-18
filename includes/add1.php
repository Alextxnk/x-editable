<?php
$link = mysqli_connect(
'localhost',  /* Хост, к которому мы подключаемся */
'root',       /* Имя пользователя */
'',   /* Используемый пароль */
'x-editable1');     /* База данных для запросов по умолчанию */

if (!$link) {
    printf("Невозможно подключиться к базе данных. Код ошибки: %s\n", mysqli_connect_error());
    exit;
}

if (isset($_POST['name'])) {
    $name = $_POST['name'];
    $user_id= $_POST['user_id'];
    $email= $_POST['email'];
    $phone= $_POST['phone'];
    $pasport= $_POST['pasport'];
    $inn= $_POST['inn'];
    
    if ($_POST['name'] == 'date') {
        $newValue = strtotime($_POST['value']);
        //echo $newValue;
    } else if($_POST['name'] == 'address') {
        var_dump($_POST); die;
        $newValue = $_POST['value']['city'] . ', ул. ' . $_POST['value']['street'] . ', дом. ' . $_POST['value']['building'];
    } 
   //  else {
   //      $newValue = $_POST['value'];
   //  }
    $id = $_POST['pk'];
    $sql = "INSERT INTO 'employees' ('user_id', 'name', 'email', 'phone', 'date', 'address', 'pasport', 'inn') VALUES ('$user_id', '$name', '$email', '$phone', '$newValue', '$newValue', '$pasport', '$inn');";
    mysqli_query($link, $sql);
}

header('Location: /profile.php');
die;