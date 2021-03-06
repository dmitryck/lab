<?php

if (isset($_POST['submitForm'])) {
	if ( empty($_POST['user']) || empty($_POST['password']) ) {
		$error = 'Заполниет форму.';
	}
	try {
		$username = strip_tags(trim($_POST['user']));
		$password = trim($_POST['password']);
		$encoded_password = base64_encode(sha1($password, true));
		$htpasswd_content = $username . ':{SHA}' . $encoded_password;
		file_put_contents('./test/.htpasswd', $htpasswd_content);
		// header('Location: password_for_a_htpasswd.php');
	} catch(Exception $e) {
		$error = '';
		$error.= "<p>";
		$error.= $e->errorInfo[2];
		$error.= "</p>";
		$error.= '<pre>';
		$error.= $e->getTraceAsString();
		$error.= '</pre>';
	}
}

?>

<!DOCTYPE html>
<html lang="ru">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Кодирование пароля для htpasswd</title>

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h1 class="text-center"><a href="">Кодирование пароля для htpasswd</a></h1>
					<h2>Логин и пароль для доступа к папке ./test/</h2>
					<form action="" method="POST" role="form">
						<div class="form-group">
							<input name="user" type="text" class="form-control" placeholder="Логин">
						</div>
						<div class="form-group">
							<input name="password" type="password" class="form-control" placeholder="Пароль">
						</div>
						<button type="submit" name="submitForm" class="btn btn-primary">Кодировать</button>
					</form>

					<?php if (isset($error)): ?>
						<hr>
						<?= $error ?>
					<?php endif ?>

					<?php if (!isset($error)&&isset($htpasswd_content)): ?>
					<hr>
					<h2>Содержимое файл <code>test/.htaccess</code></h2>
					<pre><?= file_get_contents('test/.htaccess'); ?></pre>
					<h2>Содержимое файла <code>test/.htpasswd</code></h2>
					<pre><?= $htpasswd_content ?></pre>
					<hr>
					<h2>Проверить</h2>
					<p><a href="./test/test.php" target="_blank">./test/test.php</a></p>
					<?php endif; ?>

				</div>
			</div>
		</div>
		<!-- jQuery -->
		<script src="//code.jquery.com/jquery.js"></script>
		<!-- Bootstrap JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<script src="Hello World"></script>
	</body>
</html>