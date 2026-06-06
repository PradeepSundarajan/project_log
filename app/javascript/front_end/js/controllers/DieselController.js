app.controller('DieselController', function($scope, DieselService) {
  DieselService.getAll().then(res => $scope.txns = res.data);

  $scope.deleteTxn = function(id) {
    if (confirm('Delete this diesel transaction?')) {
      DieselService.delete(id).then(() => location.reload());
    }
  };
});