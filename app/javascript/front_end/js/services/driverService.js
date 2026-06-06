app.factory('DriverService', function($http) {
  var baseUrl = '/api/v1/drivers';
  return {
    getAll: () => $http.get(baseUrl),
    get: id => $http.get(`${baseUrl}/${id}`),
    create: driver => $http.post(baseUrl, driver),
    update: (id, driver) => $http.put(`${baseUrl}/${id}`, driver),
    delete: id => $http.delete(`${baseUrl}/${id}`)
  };
});