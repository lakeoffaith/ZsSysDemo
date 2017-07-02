'use strict';
angular.module('Hospital.services', [])
.factory('Auth', ['$window', function($window) {
		var kCurrentUserKey = 'currentUserKey';
		var getCurrentUser = function () {
			var str = $window.localStorage.getItem(kCurrentUserKey);
			var currentUser = angular.fromJson(str) || {};
			return currentUser;
		};
    	var getPermissions = function() {
        	var user = getCurrentUser();
        	var permissions = user.permissions || {};
        	return permissions;
    	};
     	var getEditionPower=function(){//获取版本权限信息
		 	var str = $window.localStorage.getItem(kCurrentUserKey);
		 	var currentUser = angular.fromJson(str) || {};
		 	var urlVersionJson = angular.fromJson(currentUser.urlVersionJson) || {};//字符串转换成对象
		 	return urlVersionJson;
	 	};
		return {
			user: getCurrentUser,
			editionPower:getEditionPower,//return版本权限数据
			token: function() {
				return getCurrentUser().token;
			},
			login: function(data) {
            	data = data || {};
            	var list = data.permissionTOs || [];
            	var permissions = {};
		    	for(var i in list) {
                	var item = list[i];
                	permissions[item.permissionEnName] = true;
                	permissions['GROUP_' + item.permissionGroupId] = true;// 控制整个组的显示
            	}
            	data.permissions = permissions;
            	delete data.permissionTOs;
            	var str = angular.toJson(data);
            	$window.localStorage.setItem(kCurrentUserKey, str);
			},
			logout: function() {
            	$window.localStorage.removeItem(kCurrentUserKey);
			},
        	isMaster: function() {
            	var user = getCurrentUser();
            	return user.stationType > 0;
        	},
        	permit: function(key) {
            	var permissions = getPermissions();
            	return permissions[key];
        	},
			loading: 0
		};
}])
.factory('authInterceptor', ['$q', '$location', 'Auth', function($q, $location, Auth) {
	// config http interceptor
	var interceptor = {
			'request': function(config) {
				Auth.loading ++;
				var path = $location.path();
				if(Auth.token()) {
					if(angular.equals(path, '/login')) {
						$location.path('/');
						return config;
					}
					config.headers = config.headers || {};
					config.headers.token = Auth.token();
				} else {
					if (!angular.equals(path, '/login')) {
						$location.path('/login');
					}
					return config;
				}
				//console.log('request config: ', config);
				return config;
			},
			'requestError': function(rejection) {
				Auth.loading > 0 ? Auth.loading-- : '';
				console.log('requestError: ', rejection);
				return $q.reject(rejection);
			},
			'response': function(res) {
				Auth.loading > 0 ? Auth.loading-- : '';
				if(res && res.status === 200 && res.data && (res.data.code === 70000 || res.data.code === 70003)) {
                    // 请求数据，并且正常返回，但是状态码不对，可能是session过期
					console.log('response: ', res);
					Auth.logout();
					$location.path('/login');
                }
				return res;
			},
			'responseError': function(rejection) {
				Auth.loading > 0 ? Auth.loading-- : '';
				console.log('responseError: ', rejection);
				return $q.reject(rejection);
			}
	};
	return interceptor;
}])
.factory('BaseData', ['$http', function($http) {
	var stations = [], oilProducts = [], chargeStations=[], memberGrades=[];
	function queryStation() {
//		$http.post(API_SERVER + 'station/list').success(function(res) {
		$http.post(API_SERVER + 'stationAdmin/getManagerStation').success(function(res) {
			console.log(res);
			stations.length = 0;
            if(res && res.code === 0 && res.data) {
                var list = res.data;
			    for(var i in list) {
				    stations.push(list[i]);
			    }
            }
		});
	}
	function queryChargeStation() {
//		$http.post(API_SERVER + 'station/list').success(function(res) {
		$http.post(API_SERVER + 'stationAdmin/getManagerStation').success(function(res) {
			console.log(res);
			chargeStations.length = 0;
			if(res && res.code === 0 && res.data) {
				var list = res.data;
				for(var i in list) {
					chargeStations.push(list[i]);
				}
			}
		});
	};
	function queryOilProduct() {
		$http.post(API_SERVER + 'station/listPRConfig').success(function(res) {
			oilProducts.length = 0;
            if(res && res.code === 0 && res.data) {
                var list = res.data.list;
			    for(var i in list) {
			        // for checkbox
			        list[i].selected = false;
				    oilProducts.push(list[i]);
			    }
            }
		});
	};
	function queryMemberGrade() {
		$http.post(API_SERVER + 'crm/listGrade').success(function(res) {
			memberGrades.length = 0;
			if(res && res.code === 0 && res.data) {
				var list = res.data.list;
				for(var i in list) {
					// for checkbox
					list[i].selected = false;
					memberGrades.push(list[i]);
				}
			}
		});
	};

	return {
		paidStatusMap: {
			'-1': '无需支付',
			'0': '待确定',
			'1': '已支付'
		}, 
		sourceTypeMap: {
			'1': '云平台',
			'2': '客户端',
			'3': '微信'
		},
        memberTypeMap: {
            '1': '散户',
            '2': '企业总账户',
            '3': '企业子账户'
        },
        transferTypeMap: {
            '1': '转出',
            '2': '转入'
        },
		defaultPageInfo: {
			pn: 1,
			ps: 20,
			pc: 0
		},
        defaultModalPageInfo: {
			pn: 1,
			ps: 10,
			pc: 0
		},
		stations: stations,
		chargeStations: chargeStations,
		oilProducts: oilProducts,
		memberGrades: memberGrades,

		clear: function() {
            stations.length = 0;
            chargeStations.length = 0;
            oilProducts.length = 0;
            memberGrades.length = 0;
        },
		getStations: function() {
			// 虽然是异步，但是传的是引用，很好的结合了angular数据通知功能
			if(stations.length === 0) {
				queryStation();
			} else {
			    // for checkbox
				for(var i in stations) {
					stations[i].selected = false;
				}
			}
			return stations;
		},
		getChargeStations: function() {
			// 虽然是异步，但是传的是引用，很好的结合了angular数据通知功能
			if(chargeStations.length === 0) {
				queryChargeStation();
			} else {
				// for checkbox
				for(var i in stations) {
					chargeStations[i].selected = false;
				}
			}
			return chargeStations;
		},
		getOilProducts: function() {
			if(oilProducts.length === 0) {
				queryOilProduct();
			}
			return oilProducts;
		},
		getMemberGrades: function() {
			if(memberGrades.length === 0) {
				queryMemberGrade();
			}
			return memberGrades;  
		}
	};		
}])
	/*--导出报表函数--*/
	.factory('Excel', function ($window) {
		var uri = 'data:application/vnd.ms-excel;base64,',
			template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
			base64 = function (s) { return $window.btoa(unescape(encodeURIComponent(s))); },
			format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) };
		return {
			tableToExcel: function (tableId, worksheetName) {
				var table = jQuery(tableId),
					ctx = { worksheet: worksheetName, table: table.html() },
					href = uri + base64(format(template, ctx));
				var filename=worksheetName+'.xls';
				var a = document.createElement('a');
				document.body.appendChild(a);
				a.setAttribute('style', 'display:none');
				a.setAttribute('href', href);
				a.setAttribute('download', filename);
				a.click();
				return 0;
			}
		};
	});
