app.controller('PartiesController', function($scope, PartyService) {
  PartyService.getAll().then(res => $scope.parties = res.data);

  $scope.deleteParty = function(id) {
    if (confirm('Delete this party?')) {
      PartyService.delete(id).then(() => location.reload());
    }
  };
});