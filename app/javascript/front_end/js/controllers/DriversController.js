app.controller('DriversController', function($scope, $routeParams, DriverService) {
  if ($routeParams.id) {
    DriverService.get($routeParams.id).then(res => $scope.driver = res.data);
  } else {
    DriverService.getAll().then(res => $scope.drivers = res.data);
  }

  $scope.deleteDriver = function(id) {
    if (confirm('Delete this driver?')) {
      DriverService.delete(id).then(() => location.reload());
    }
  };
});