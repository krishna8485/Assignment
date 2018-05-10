angular.module('flightapp').controller('flightCtrl', ['$scope', '$http', '$rootScope',
    function flightCtrl ($scope, $http, $rootScope){
    var self = this;
    $scope.IsVisible = false;
    $scope.searchOrigin = function() {
        $scope.IsVisible = false;
        return $http.get("/getAirportLists?query="+ $scope.flightCtrl.searchOrigin)
            .then(function successCallback(response) {
            return response.data.data;
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


        $scope.searchAddOrigin = function() {
            $scope.IsVisible = false;
            return $http.get("/getAirportLists?query="+ $scope.flightCtrl.searchAddOrigin)
                .then(function successCallback(response) {
                    return response.data.data;
                }, function errorCallback(response) {
                    console.log(response.data);
                    return response.data;
                });
        }

        $scope.searchAddDest = function() {
            $scope.IsVisible = false;
            return $http.get("/getAirportLists?query="+ $scope.flightCtrl.searchAddDest)
                .then(function successCallback(response) {
                    return response.data.data;
                }, function errorCallback(response) {
                    console.log(response.data);
                    return [];
                });
        }

    $scope.generateTable=function() {
        $scope.IsVisible = false;
         $http.get("/getResults?origin="+ $scope.flightCtrl.searchOrigin+"&destination="+$scope.flightCtrl.searchDestination)
            .then(function successCallback(response) {
                $scope.flightList= response.data.data;
            }, function errorCallback(response) {
                console.log(response.data);
                $scope.flightList =[];
            });
        $scope.IsVisible=true;

    }

    $scope.addFlight=function() {

        searchResult = {
            origin : $scope.flightCtrl.searchAddOrigin,
            destination: $scope.flightCtrl.searchAddDest,
            fare:$scope.searchForm.fare.$$rawModelValue
        };

        myJSON = JSON.stringify(searchResult);

            $http.post("/addFlight",myJSON)
                .then(function successCallback(response) {
                    $scope.flightList= response.data.data;
                }, function errorCallback(response) {
                    console.log(response.data);
                    $scope.flightList =[];
                });

        $http.post("/addFlights",myJSON,$scope.flightCtrl.selectedAddOrigin, $scope.flightCtrl.selectedAddDest)
            .then(function successCallback(response) {
                $scope.flightList= response.data.data;
            }, function errorCallback(response) {
                console.log(response.data);
                $scope.flightList =[];
            });

    }


}]);
