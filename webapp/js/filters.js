'use strict'

angular.module('Hospital.filters', [])
.filter('datetime', ['$window', function($window) {
    return function(input, format) {
        if(!input) {
            return '';
        }
        var datetime = $window.moment(input);
        if(!datetime) {
            return input;
        }
        if(format) {
            return datetime.format(format);
        }
        return datetime.format('YYYY-MM-DD HH:mm:ss');
    };
}]);