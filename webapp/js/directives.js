'use strict';

angular.module('Hospital.directives', [])
    .directive('pageBox', function () {/*--分页自定义指令设置--*/
        return {
            restrict: 'AE',
            templateUrl: 'views/template/pageBox.html',
            link: function ($scope) {
                $scope.makePages = function (pn, pc) {
                    var pages = [];
                    for (var i = pn - 3; i <= pn + 3; i++) {
                        if (i > 0 && (!pc || i <= pc) && pc !== 0) {
                            pages.push(i);
                        }
                    }
                    return pages;
                };
            }
        };
    })
    .directive('echartsPageBox', function () {/*--分页自定义指令设置--*/
        return {
            restrict: 'AE',
            templateUrl: 'views/template/echartsPageBox.html',
            link: function ($scope) {
                $scope.makePages = function (pn, pc) {
                    var pages = [];
                    for (var i = pn - 3; i <= pn + 3; i++) {
                        if (i > 0 && (!pc || i <= pc) && pc !== 0) {
                            pages.push(i);
                        }
                    }
                    return pages;
                };
            }
        };
    })
    .directive('stationSelect', ['BaseData', function (BaseData) {
        return {
            restrict: 'AE',
            replace: true,
            template: '<select class="form-control" ng-model="params.stationId">'
            + '<option value="">全部</option>'
            + '<option ng-repeat="station in stations" value="{{station.stationId}}">{{station.stationName}}</option>'
            + '</select>',
            link: function ($scope) {
                $scope.stations = BaseData.getStations();
            }
        };
    }])
    .directive('memberGradesSelect', ['BaseData', function (BaseData) {
        return {
            restrict: 'AE',
            replace: true,
            template: '<select class="form-control" ng-model="params.gradeId">'
            + '<option value="">全部</option>'
            + '<option ng-repeat="memberGrade in memberGrades" value="{{memberGrade.gradeId}}">{{memberGrade.gradeName}}</option>'
            + '</select>',
            link: function ($scope) {
                $scope.memberGrades = BaseData.getMemberGrades();
            }
        };
    }])
    .directive('productSelect', ['BaseData', function (BaseData) {
        return {
            restrict: 'AE',
            replace: true,
            template: '<select class="form-control" ng-model="params.PRId">'
            + '<option value="">全部</option>'
            + '<option ng-repeat="product in oilProducts" value="{{product.PRId}}">{{product.PRName}}</option>'
            + '</select>',
            link: function ($scope) {
                $scope.oilProducts = BaseData.getOilProducts();
            }
        };
    }])
    .directive('paidStatusSelect', ['BaseData', function (BaseData) {
        return {
            restrict: 'AE',
            replace: true,
            template: '<select class="form-control" ng-model="params.paidStatus">'
            + '<option value="">全部</option>'
            + '<option ng-repeat="(key, value) in paidStatusMap" value="{{key}}">{{value}}</option>'
            + '</select>',
            link: function ($scope) {
                $scope.paidStatusMap = BaseData.paidStatusMap;
            }
        };
    }])
    .directive('transferTypeSelect', ['BaseData', function (BaseData) {
        return {
            restrict: 'AE',
            replace: true,
            template: '<select class="form-control" ng-model="params.transferType">'
            + '<option value="">全部</option>'
            + '<option ng-repeat="(key, value) in transferTypeMap" value="{{key}}">{{value}}</option>'
            + '</select>',
            link: function ($scope) {
                $scope.transferTypeMap = BaseData.transferTypeMap;
            }
        };
    }])
    .directive('dateFormat', ['$window', function ($window) {
        return {
            require: '^ngModel',
            restrict: 'A',
            link: function ($scope, elem, attrs, ctrl) {
                var moment = $window.moment;
                var dateFormat = attrs.dateFormat || 'YYYY-MM-DD';
                ctrl.$formatters.unshift(function (modelValue) {
                    if (!dateFormat || !modelValue) {
                        return '';
                    }
                    var retVal = moment(modelValue).format(dateFormat);
                    return retVal;
                });

                ctrl.$parsers.unshift(function (viewValue) {
                    var date = moment(viewValue);
                    return (date && date.isValid()) ? date.format(dateFormat) : '';
                });
            }
        };
    }])
    .directive('datePicker', function () {
        return {
            restrict: 'AE',
            scope: {
                'id': "@id",
                'selectedDate': "=selectedDate"
            },
            replace: true,
            templateUrl: 'views/template/datePicker.html'
        };
    })
    .directive('timePicker', function () {
        return {
            restrict: 'AE',
            scope: {
                'id': "@id",
                'selectedDate': "=selectedDate"
            },
            replace: true,
            templateUrl: 'views/template/timePicker.html'
        };
    })
    .directive('accordion', function ($compile) {
        return {
            restrict: 'EA',
            replace: true,
            scope: {
                expander: '=',
                childrenList: '=',
                areaData: '='
            },
            template: "<ul class='fatherUl'> <li class='childLi'><span ng-click='expand()' class='childSpan'>{{expander.name}}</span></li></ul>",
            link: function (scope, elm) {
                if (scope.childrenList) {
                    var html = $compile("<accordion  expander='expander' children-list='expander.childrenList' area-data='areaData' ng-repeat='expander in childrenList'></accordion>")(scope);
                    elm.append(html);
                }
            },
            controller: function($scope){
                $scope.expand=function(){
                    console.log($scope.areaData);
                    console.log($scope.areaData.status);
                    if($scope.areaData.status==0){//油站分区
                        $scope.areaData.level=$scope.expander.level;
                        $scope.areaData.parentId=$scope.expander.parentId;
                        $scope.areaData.id=$scope.expander.id;
                        $scope.areaData.childrenList=$scope.childrenList;
                        $scope.areaData.removeBtnStatus=false;
                        $scope.areaData.modifyBtnStatus=false;
                        jQuery('#operationModal').modal('show');
                    }
                    else if($scope.areaData.status==1){//油站查询
                        $scope.areaData.areaId=$scope.expander.id;
                        $scope.areaData.areaName=$scope.expander.name;
                        jQuery('#confirmArea').modal('show');
                    }
                    else if($scope.areaData.status==2){//员工管理
                        $scope.areaData.id=$scope.expander.id;
                        $scope.areaData.allStationType=$scope.areaData.id;
                        $scope.areaData.name=$scope.expander.name;
                        jQuery('#areaId').modal('hide');
                    }
                };
            }
        };
    });

