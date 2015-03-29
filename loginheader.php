<?php 

session_start();
// return to the current page after login.
$_SESSION['authstation'] = 'http' . (isset($_SERVER['HTTPS']) ? 's' : '') . '://' . "{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";

if ( !isset($_SESSION["userprofile"]) ) { 

?>

<li><a href="#">login at:</a>
<li><a href="ssa/auth/login.php?app=facebook"class="button fb">Facebook</a>
<li><a href="ssa/auth/login.php?app=google" class="button gg">Google</a>
<!-- <li><a href="ssa/auth/login.php?app=twitter" class="button tt">Twitter</a> -->

<?php } else { ?>

<li><a href="#">logged in as <?php echo $_SESSION["userprofile"]['name']; ?></a>
<li><a href="ssa/auth/logout.php">Logout</a>
<li><a href="endsession.php">End Session</a>

<?php } ?>
