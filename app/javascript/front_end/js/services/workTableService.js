app.factory('WorkTableService', function($http) {
  var baseUrl = '/api/v1/work_tables';
  return {
    getAll: () => $http.get(baseUrl),
    get: id => $http.get(`${baseUrl}/${id}`),
    create: work => $http.post(baseUrl, work),
    update: (id, work) => $http.put(`${baseUrl}/${id}`, work),
    delete: id => $http.delete(`${baseUrl}/${id}`)
  };
});