<!doctype html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angular_material/1.1.8/angular-material.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-animate.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-aria.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-messages.min.js"></script>

  <!-- Angular Material Library -->
  <script src="https://ajax.googleapis.com/ajax/libs/angular_material/1.1.8/angular-material.min.js"></script>

  <script>

      var app = angular.module('flightapp', []);
      app.controller('flightCtrl', function($scope, $http) {

      });



  </script>
  <!-- Your application bootstrap  -->
</head>
<body  ng-app="flightapp"  ng-controller="flightCtrl">
<div layout="column" ng-cloak="" class="autocompletedemoFloatingLabel" >
  <md-content class="md-padding">
    <form ng-submit="$event.preventDefault()" name="searchForm">
      <p>The following example demonstrates floating labels being used as a normal form element.</p>
      <div layout-gt-sm="row">
        <md-input-container flex="">
          <label>Name</label>
          <input type="text">
        </md-input-container>
        <md-autocomplete flex="" required="" md-input-name="autocompleteField" md-input-minlength="2" md-input-maxlength="18" md-no-cache="flightCtrl.noCache" md-selected-item="flightCtrl.selectedItem" md-search-text="flightCtrl.searchText" md-items="item in flightCtrl.querySearch(flightCtrl.searchText)" md-item-text="item.display" md-require-match="" md-floating-label="Favorite state">
          <md-item-template>
            <span md-highlight-text="flightCtrl.searchText">{{item.display}}</span>
          </md-item-template>
          <div ng-messages="searchForm.autocompleteField.$error" ng-if="searchForm.autocompleteField.$touched">
            <div ng-message="required">You <b>must</b> have a favorite state.</div>
            <div ng-message="md-require-match">Please select an existing state.</div>
            <div ng-message="minlength">Your entry is not long enough.</div>
            <div ng-message="maxlength">Your entry is too long.</div>
          </div>
        </md-autocomplete>
      </div>
    </form>
  </md-content>
</div>

</body>
</html>