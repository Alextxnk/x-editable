<?php 
    include_once "includes/header.php"; 
    if(!isset($_SESSION['user']['id'])) header('Location: /');

	//$links = get_user_links($_SESSION['user']['id']);

	$error = '';
	if (isset($_SESSION['error']) && !empty($_SESSION['error'])) {
		$error = $_SESSION['error'];
		$_SESSION['error'] = '';
    }
    $success = '';
	if (isset($_SESSION['success']) && !empty($_SESSION['success'])) {
		$success = $_SESSION['success'];
		$_SESSION['success'] = '';
	}
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>PHP + X-editable + Bootstrap, простой пример использования</title>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="css/address.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


    <link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/>
    <script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>

    <script src="js/address.js" type="text/javascript"></script>

    <script>
        $.fn.editable.defaults.mode = 'popup';
        $(document).ready(function() {
            $('.people-editable').editable();
            $('.people-email-editable').editable({
                validate: function(value) {
                    if(!isEmail(value)) {
                        return 'Введите настоящий e-mail';
                    }
                }
            });
            $('.people-phone-editable').editable({
                type: 'text',
                tpl:'<input type="text" class="form-control people-phone">'

            }).on('shown',function(){
                $("input.people-phone").mask("(999) 999-9999");
            });
            $('.people-date-editable').editable({
                format: 'dd.mm.yyyy',
                viewformat: 'dd.mm.yyyy',
                datepicker: {
                    weekStart: 1
                }
            });
            $('.people-status-editable').editable({
                value: 'Активный',
                source: [
                    {value: 'Активный', text: 'Активный'},
                    {value: 'Заблокирован', text: 'Заблокирован'},
                    {value: 'Устарел', text: 'Устарел'}
                ]
            });
            $('.people-address-editable').editable({
                value: {
                }
            });
        });
        function isEmail(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }
    </script>
</head>
<body>
<div class="container">
    <div class="jumbotron">
        <h1>PHP + X-editable + Bootstrap</h1>
        <p>На примере простой адресной книги</p>
    </div>
    <?php
    $link = mysqli_connect(
        'localhost',
        'root',
        '',
        'x-editable1');
    if (!$link) {
        printf("Невозможно подключиться к базе данных. Код ошибки: %s\n", mysqli_connect_error());
        exit;
    }

    if ($result = mysqli_query($link, 'SELECT * FROM people ORDER BY id')) {
        echo '<table class="table">' .
            '<thead>' .
            '<tr>' .
            '<th>Имя</th>' .
            '<th>E-mail</th>' .
            '<th>Телефон</th>' .
            '<th>Компания</th>' .
            '<th>Заметка</th>' .
            '<th>Дата</th>' .
            '<th>Адрес</th>' .
            '<th>Статус</th>' .
            '</tr>' .
            '</thead>';
        while( $row = mysqli_fetch_assoc($result) ){
            echo '<tr>' .
                '<td><a href="#" class="people-editable" data-name="name" data-type="text" data-title="Имя" data-pk="' . $row['id'] . '" data-url="ajax.php" >' . $row['name'] . '</a></td>' .
                '<td><a href="#" class="people-email-editable" data-name="email" data-type="text" data-pk="' . $row['id'] . '" data-url="ajax.php" >' . $row['email'] . '</a></td>' .
                '<td><a href="#" class="people-phone-editable" data-name="phone" data-type="text" data-pk="' . $row['id'] . '" data-url="ajax.php" >' . $row['phone'] . '</a></td>' .
                '<td><a href="#" class="people-editable" data-name="company" data-type="text" data-pk="' . $row['id'] . '" data-url="ajax.php" >' . $row['company'] . '</a></td>' .
                '<td><a href="#" class="people-editable" data-name="note" data-type="textarea" data-pk="' . $row['id'] . '" data-url="ajax.php" >' . $row['note'] . '</a></td>' .
                '<td><a href="#" class="people-date-editable" data-name="date" data-type="date" data-type="text" data-pk="' . $row['id'] . '" data-url="ajax.php" >' . date('d.m.Y', $row['date']) . '</a></td>' .
                '<td><a href="#" class="people-address-editable" data-name="address" data-type="address" data-pk="' . $row['id'] . '" data-url="ajax.php" >' . $row['address'] . '</a></td>' .
                '<td><a href="#" class="people-status-editable" data-name="status" data-type="select" data-pk="' . $row['id'] . '" data-url="ajax.php" >' . $row['status'] . '</a></td>' .
                '</tr>';
        }
        echo '</table>';
        mysqli_free_result($result);
    }

    mysqli_close($link);
    ?>
</div>


</body>
</html>