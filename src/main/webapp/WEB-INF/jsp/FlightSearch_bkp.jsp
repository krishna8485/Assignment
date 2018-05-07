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

  <script src="js/flight/app.js"></script>
  <script src="js/flight/flightSearchCtrl.js"></script>
  <!-- Your application bootstrap  -->
  <%--<script type="text/javascript">--%>
     <%-- /**
       * You must include the dependency on 'ngMaterial'
       */
     /* var app = angular.module('flightapp', ['ngMaterial', 'ngMessages']);
      app.controller('flightCtrl', function($timeout, $q) {
              var self = this;

              // list of `state` value/display objects
              self.states        = loadAll();
              self.selectedItem  = null;
              self.searchText    = null;
              self.querySearch   = querySearch;

              // ******************************
              // Internal methods
              // ******************************

              /!**
               * Search for states... use $timeout to simulate
               * remote dataservice call.
               *!/
              function querySearch (query) {
                  var results = query ? self.states.filter( createFilterFor(query) ) : self.states;
                  var deferred = $q.defer();
                  $timeout(function () { deferred.resolve( results ); }, Math.random() * 1000, false);
                  return deferred.promise;
              }

              /!**
               * Build `states` list of key/value pairs
               *!/
              function loadAll() {
                  var allStates = 'Alabama, Alaska, Arizona, Arkansas, California, Colorado, Connecticut, Delaware,\
              Florida, Georgia, Hawaii, Idaho, Illinois, Indiana, Iowa, Kansas, Kentucky, Louisiana,\
              Maine, Maryland, Massachusetts, Michigan, Minnesota, Mississippi, Missouri, Montana,\
              Nebraska, Nevada, New Hampshire, New Jersey, New Mexico, New York, North Carolina,\
              North Dakota, Ohio, Oklahoma, Oregon, Pennsylvania, Rhode Island, South Carolina,\
              South Dakota, Tennessee, Texas, Utah, Vermont, Virginia, Washington, West Virginia,\
              Wisconsin, Wyoming';

                  return allStates.split(/, +/g).map( function (state) {
                      return {
                          value: state.toLowerCase(),
                          display: state
                      };
                  });
              }

              /!**
               * Create filter function for a query string
               *!/
              function createFilterFor(query) {
                  var lowercaseQuery = angular.lowercase(query);

                  return function filterFn(state) {
                      return (state.value.indexOf(lowercaseQuery) === 0);
                  };

              }


      });
      //angular
         // .module('flightapp', ['ngMaterial', 'ngMessages', 'material.svgAssetsCache'])
         // .controller('flightCtrl', flightCtrl);*/--%>


 <%-- </script>--%>
</head>
<body  ng-controller="flightCtrl" data-ng-app="flightapp">
<form name="searchForm" ng-submit="$event.preventDefault()" >
  <div layout="column" ng-cloak="" class="autocompletedemoFloatingLabel" >
    <md-content class="md-padding">
        <p>The following example demonstrates floating labels being used as a normal form element.</p>
        <div layout-gt-sm="row">
          <%--<md-autocomplete flex required
                           md-input-name="autoCmpltOriginField"
                           md-input-minlength="2"
                           md-input-maxlength="18"
                           md-no-cache="flightCtrl.noCache"
                           md-selected-item="flightCtrl.selectedItemOrigin"
                           md-search-text="flightCtrl.searchTextOrigin"
                           md-items="item in flightCtrl.querySearch(flightCtrl.searchTextOrigin)"
                           md-item-text="item.displayOrigin"
                           md-require-match
                           md-floating-label="Origin">
            <md-item-template>
              <span md-highlight-text="flightCtrl.searchTextOrigin">{{item.displayOrigin}}</span>
            </md-item-template>
            <div ng-messages="searchForm.autoCmpltOriginField.$error" ng-if="searchForm.autoCmpltOriginField.$touched">
              <div ng-message="required">You <b>must</b> have a origin.</div>
              <div ng-message="md-require-match">Please select an existing state.</div>
              <div ng-message="minlength">Your entry is not long enough.</div>
              <div ng-message="maxlength">Your entry is too long.</div>
            </div>
          </md-autocomplete>--%>
          <md-autocomplete flex required
                           md-input-name="autocompleteField"
                           md-input-minlength="2"
                           md-input-maxlength="18"
                           md-no-cache="flightCtrl.noCache"
                           md-selected-item="flightCtrl.selectedItem"
                           md-search-text="flightCtrl.searchText"
                           md-items="item in flightCtrl.querySearch(flightCtrl.searchText)"
                           md-item-text="item.display"
                           md-require-match
                           md-floating-label="Destination">
            <md-item-template>
              <span md-highlight-text="flightCtrl.searchText">{{item.display}}</span>
            </md-item-template>
            <div ng-messages="searchForm.autocompleteField.$error" ng-if="searchForm.autocompleteField.$touched">
              <div ng-message="required">You <b>must</b> have a destination.</div>
              <div ng-message="md-require-match">Please select an existing state.</div>
              <div ng-message="minlength">Your entry is not long enough.</div>
              <div ng-message="maxlength">Your entry is too long.</div>
            </div>
          </md-autocomplete>
        </div>
    </md-content>

  </div>
</form>

</body>
</html>