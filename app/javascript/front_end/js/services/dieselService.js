app.factory('DieselService', function($http) {
  var baseUrl = '/api/v1/diesel_transactions';
  return {
    getAll: () => $http.get(baseUrl),
    get: id => $http.get(`${baseUrl}/${id}`),
    create: txn => $http.post(baseUrl, txn),
    update: (id, txn) => $http.put(`${baseUrl}/${id}`, txn),
    delete: id => $http.delete(`${baseUrl}/${id}`)
  };
});