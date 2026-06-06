app.controller('WorkTablesController', function($scope, $routeParams, WorkTableService) {
  if ($routeParams.id) {
    WorkTableService.get($routeParams.id).then(res => $scope.work = res.data);
  } else {
    WorkTableService.getAll().then(res => $scope.works = res.data);
  }

  $scope.deleteWork = function(id) {
    if (confirm('Delete this work entry?')) {
      WorkTableService.delete(id).then(() => location.reload());
    }
  };
});