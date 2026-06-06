var app = angular.module('WorkMonitorApp', ['ngRoute']);

app.config(function($routeProvider) {
  $routeProvider
    .when('/vehicles', {
      templateUrl: 'views/vehicles/index.html',
      controller: 'VehiclesController'
    })
    .when('/vehicles/:id', {
      templateUrl: 'views/vehicles/show.html',
      controller: 'VehiclesController'
    })
    .when('/drivers', {
      templateUrl: 'views/drivers/index.html',
      controller: 'DriversController'
    })
    .when('/drivers/:id', {
      templateUrl: 'views/drivers/show.html',
      controller: 'DriversController'
    })
    .when('/work_tables', {
      templateUrl: 'views/work_tables/index.html',
      controller: 'WorkTablesController'
    })
    .when('/work_tables/:id', {
      templateUrl: 'views/work_tables/show.html',
      controller: 'WorkTablesController'
    })
    .when('/diesel', {
      templateUrl: 'views/diesel/index.html',
      controller: 'DieselController'
    })
    .when('/parties', {
      templateUrl: 'views/parties/index.html',
      controller: 'PartiesController'
    })
    .otherwise({
      redirectTo: '/vehicles'
    });
});