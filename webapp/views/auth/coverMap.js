/**
 * Created by Administrator on 2016/10/31.
 */
angular.module('Hospital.coverMap', ['ngRoute','ngAnimate'])
.config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/coverMap', {
        templateUrl: 'views/auth/coverMap.html'
    });
}])
.controller('coverMapCtrl', ['$scope', '$timeout', function($scope, $timeout) {
        $scope.showtop=false;
        $scope.shoeTop=function(){
            $scope.showtop=true;
        }
}]);