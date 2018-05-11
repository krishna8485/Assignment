angular.module('flightapp').controller('flightCtrl', ['$scope', '$http', '$rootScope',
    function flightCtrl ($scope, $http, $rootScope){
    var self = this;
    $scope.IsVisible = false;

        //get the airport list
        $scope.searchAirport= function(queryStr) {
            $scope.IsVisible = false;
            return $http.get("/getAirportLists?query="+ queryStr)
                .then(function successCallback(response) {
                    return response.data.data;
                }, function errorCallback(response) {
                    console.log(response.data);
                    return [];
                });
        }

        //get the flight result for given origin and destination
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

    //Add new origin, destination & fare details
    $scope.addFlight=function() {

        var inputdata = {'originAirport': $scope.flightCtrl.selectedAddOrigin, 'destAirport': $scope.flightCtrl.selectedAddDest,
                        fare: $scope.searchForm.fare.$$rawModelValue};
        $http.post("/addFlights",inputdata)
            .then(function successCallback(response) {
                console.log("Success");
                //$scope.flightList= response.data.data;
            }, function errorCallback(response) {
                console.log(" ");
                //$scope.flightList =[];
            });

    }


}]);
