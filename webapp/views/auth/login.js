'use strict';

angular.module('Hospital.auth.login', ['ngRoute', 'Hospital.services'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/login', {
		templateUrl: 'views/auth/login.html'	
	});		
}])

.controller('loginCtrl', ['$location', '$http', '$scope', 'Auth', function($location, $http, $scope, Auth) {
	$scope.login = function() {
		$http.post(API_SERVER + 'auth/login', $scope.data).success(function(res) {
			console.log(res);
          if(res && res.code === 0) {
			  delete res.data.adminId;
			  delete res.data.password;
			  Auth.login(res.data);
			  window.location='#/coverMap';/*首页封面*/
          } else {
              alert('登录失败!');
          }
		}).error(function(error) {
            alert(error);
			console.log('Login Error: ', error);
		});
	};
}]);
