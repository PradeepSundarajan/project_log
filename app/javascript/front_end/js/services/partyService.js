app.factory('PartyService', function($http) {
  var baseUrl = '/api/v1/parties';
  return {
    getAll: () => $http.get(baseUrl),
    get: id => $http.get(`${baseUrl}/${id}`),
    create: party => $http.post(baseUrl, party),
    update: (id, party) => $http.put(`${baseUrl}/${id}`, party),
    delete: id => $http.delete(`${baseUrl}/${id}`)
  };
});