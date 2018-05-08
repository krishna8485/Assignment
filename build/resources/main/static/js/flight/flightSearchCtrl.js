angular.module('flightapp').controller('flightCtrl', ['$scope', '$http', '$rootScope',
    function flightCtrl ($scope, $http, $rootScope){
    var self = this;
    $scope.IsVisible = false;
    $scope.querySearch = function() {
        return $http.get("/getAirportNames?query="+ $scope.searchTextOrigin)
            .then(function (response) {
                return response.data;
            });

        /*return [{name: 'london', code:'LHR'},
            {name:'Sanfranciso', code:'SFO'}];*/
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
