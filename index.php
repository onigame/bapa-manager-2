<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script src="/js/angular-resource.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BAPA Manager</title>
</head>
<body>

<?php include_once("loginheader.php"); ?>

<h1>Hello World</h1>

<h2>Angular testing</h2>

<script>
var app = angular.module('myApp', ['ngResource']);

app.factory('Leagues', ['$resource', function($resource) {
  return $resource( '/league/:leagueId', { leagueId: '@leagueId' }, {
    custom_method: {
      method: 'PUT',
      params: { leagueId: '@leagueId' },
      isArray: false
    }
  });
}]);
</script>

<div ng-app="myApp">
 	<p>Name: <input type="text" ng-model="name"></p>
 	<p ng-bind="name"></p>
  <div ng-view></div>
  <script type="text/ng-template" id="list.html">
    <table>
      <tbody>
        <tr ng-repeat="league in Leagues | filter:search | orderBy:'id'" ng-show="league._id.$oid">
          <td>{{league.id}}</td>
          <td>{{league.league_name}}</td>
        </tr>
      </tbody>
    </table>
  </script>
</div>

</body>
</html>

