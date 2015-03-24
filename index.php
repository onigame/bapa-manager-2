<?php ob_start(); session_start();

$_SESSION['authstation'] = (isset($_SESSION['authstation']) ? $_SESSION['authstation'] : null);
if ( !isset($_SESSION['authstation']) ) {
	$_SESSION['authstation'] = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
}

 ?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SONHLAB Social Auth PHP Plugin Demo v2 - Login</title>
</head>
<body>

<?php
if ( !isset($_SESSION["userprofile"]) ) {
?>

<div id="header">
	LOGIN at:
</div>
<!-- Start Main Container -->
<div class="maincontainer">
	<!-- Start Facebook -->
	<a href="ssa/auth/login.php?app=facebook"class="button fb">
		<span>Facebook</span>
	</a>
	<!-- End Facebook -->
	
	<!-- Start Google -->
	<a href="ssa/auth/login.php?app=google" class="button gg">
		<span>Google</span>
	</a>
	<!-- End Google -->
	
	<!-- Start Twitter -->
	<a href="ssa/auth/login.php?app=twitter" class="button tt">
		<span>Twitter</span>
	</a>
	<!-- End Twitter -->
</div>
<!-- End Main Container -->


<?php } else { ?>

<!-- Start Main Container -->
<div class="maincontainer">

	<!-- Start Welcome -->
	<div class="welcome">
		<h2>Hi, <?php echo $_SESSION["userprofile"]['name']; ?></h2>
		<p>You are logged in successfully. See your details below.</p>
	</div>
	<!-- End Welcome -->
	
	<!-- Start Details -->
	<div class="details">

		<pre>
		<?php
				print_r($_SESSION["userprofile"]);
		?>
		</pre>
		
	</div>
	<!-- End Details -->

	<h2 class="logout">
		<a href="ssa/auth/logout.php">Logout</a>
	</h2>

	
	
	</div>
<!-- End Main Container -->
<?php } ?>

<br>

<a href="endsession.php">End Session</a>

</body>
</html>



<?php ob_end_flush(); ?>
