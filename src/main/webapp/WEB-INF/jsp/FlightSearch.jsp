<!doctype html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Angular Material style sheet -->
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angular_material/1.1.8/angular-material.min.css">
  <!-- Angular Material requires Angular.js Libraries -->
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-animate.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-aria.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-messages.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.min.js"></script>

  <!-- Angular Material Library -->
  <script src="https://ajax.googleapis.com/ajax/libs/angular_material/1.1.8/angular-material.min.js"></script>

  <script>

      var app = angular.module('flightapp', []);
      app.controller('flightCtrl', function($scope, $http) {
          var that = this;
          that.stateName = null;

          that.autoCompleteOptions = {
              minimumChars: 1,
              data: function (searchText) {
                  return $http.get('/getAirportNames')
                      .then(function (response) {
                          searchText = searchText.toUpperCase();

                          // ideally filtering should be done on the server
                          var states = _.filter(response.data, function (state) {
                              return state.name.startsWith(searchText);
                          });

                          return _.pluck(states, 'name');
                      });
              }
          }
      });



  </script>
  <!-- Your application bootstrap  -->
</head>
<body  ng-app="flightapp"  ng-controller="flightCtrl">
<form name="searchForm" ng-submit="$event.preventDefault()" >
  <div  layout="column" ng-cloak="" class="autocompletedemoFloatingLabel" >
    <input type="text"
           ng-model="flightCtrl.airportName"
           placeholder="Airport Name. Try 'p' or 'c'"
           auto-complete="flightCtrl.autoCompleteOptions" />

  </div>
</form>

</body>
</html>