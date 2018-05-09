angular.module('flightapp').controller('flightCtrl', ['$scope', '$http', '$rootScope',
    function flightCtrl ($scope, $http, $rootScope){
    var self = this;
    $scope.IsVisible = false;
    $scope.searchOrigin = function() {
        $scope.IsVisible = false;
        return $http.get("/getAirportList?query="+ $scope.flightCtrl.searchOrigin)
            .then(function successCallback(response) {
            return response.data;
        }, function errorCallback(response) {
            console.log(response.data);
            return response.data;
        });
    }

    $scope.searchDestination = function() {
            $scope.IsVisible = false;
            return $http.get("/getAirportLists?query="+ $scope.flightCtrl.searchDestination)
                .then(function successCallback(response) {
                    return response.data.data;
                }, function errorCallback(response) {
                    console.log(response.data);
                    return [];
                });
    }

    $scope.generateTable=function() {
        //var query  =
        $scope.data=[
            {
                name : "Tiger Nixon",
                work : "System Architect",

    },
            {
                name : "Garrett Winters",
                work : "Accountant",

    }];
        $scope.IsVisible=true;

    }


}]);
