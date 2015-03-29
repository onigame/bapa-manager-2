<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <link href="vendor/twbs/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="vendor/twbs/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.js"></script>
  <script src="lib/angular-resource.js"></script>
  <script src="lib/angular-ui-router.js"></script>
  <script src="vendor/twbs/bootstrap/dist/js/bootstrap.js"></script>
  <script src="lib/bootbox.js"></script>
  <script src="js/bapaApp.js"></script>

  <!-- hack to deal with anchor jumps having the nav-bar covering the item-->
  <script>window.addEventListener("hashchange", function() { scrollBy(0, -50) })</script>

  <title>BAPA Manager</title>
</head>


<body ng-app="bapaApp" role="document" style="padding-top:40px">

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
              data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">BAPA Manager</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <?php include_once("loginheader.php"); ?>
      </ul>
    </div><!--/.nav-collapse -->
  </div><!--container-->
</nav>

<div class="container" role="main">

<h2>Leagues</h2>

<div ui-view></div>

</div>

</body>
</html>

