app.controller('VehiclesController', function($scope, $routeParams, VehicleService) {
  if ($routeParams.id) {
    VehicleService.get($routeParams.id).then(res => $scope.vehicle = res.data);
  } else {
    VehicleService.getAll().then(res => $scope.vehicles = res.data);
  }

  $scope.deleteVehicle = function(id) {
    if (confirm('Delete this vehicle?')) {
      VehicleService.delete(id).then(() => location.reload());
    }
  };
});