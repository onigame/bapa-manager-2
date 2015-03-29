var app = angular.module('bapaApp', [
  'ngResource',   // for database REST connections
  'ui.router'     // for UI stuff
]);

app.factory('League', ['$resource', function($resource) {
  return $resource( '/api/league/:id', { id: '@id' } );
}]);

app.controller('LeagueListController',function($scope, $state, League) {
  $scope.leagues = League.get();
  // delete button is part of the list
  $scope.leagueDelete = function(id) {
    $scope.league = League.get(id);
    bootbox.confirm('Really delete ' + $scope.league.league_name + '?', function(result) {
      if (result) {
        $scope.league.$remove(function() {
          $state.go('leagueList');
        });
      }
    });
  }
});

app.controller('LeagueViewController',function($scope, $stateParams, League) {
  $scope.league = League.get({ id: $stateParams.id });
});

app.controller('LeagueCreateController',function($scope, $state, $stateParams, League) {
  $scope.league = new League();
  $scope.leagueCreate = function() {
    $scope.league.$save(function() {
      $state.go('leagueList'); // if creation successful, go back to leagues display
    });
  };
});

app.config(function($stateProvider) {
  $stateProvider.state('leagueList', {
    url: '/league',
    templateUrl: 'html-templates/leagueList.html',
    controller: 'LeagueListController'
  });
  $stateProvider.state('leagueView', {
    url: '/league/:id',
    templateUrl: 'html-templates/leagueView.html',
    controller: 'LeagueViewController'
  });
  $stateProvider.state('leagueCreate', {
    url: '/league',
    templateUrl: 'html-templates/leagueCreate.html',
    controller: 'LeagueCreateController'
  });
});

app.run(function($state) {
  $state.go('leagueList');
});


