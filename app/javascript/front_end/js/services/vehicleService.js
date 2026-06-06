app.factory('VehicleService', function($http) {
  var baseUrl = '/api/v1/vehicles';

  return {
    getAll: () => $http.get(baseUrl),
    get: id => $http.get(`${baseUrl}/${id}`),
    create: vehicle => $http.post(baseUrl, vehicle),
    update: (id, vehicle) => $http.put(`${baseUrl}/${id}`, vehicle),
    delete: id => $http.delete(`${baseUrl}/${id}`),
    updateStatus: (id, status) => $http.patch(`${baseUrl}/${id}/update_status`, { status: status })
  };
});