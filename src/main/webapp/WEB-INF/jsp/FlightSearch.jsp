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

</head>
<body  ng-controller="flightCtrl" data-ng-app="flightapp">
<form name="searchForm" ng-submit="$event.preventDefault()" >
  <div layout="column" ng-cloak="" class="autocompletedemoFloatingLabel" >
    <md-content class="md-padding">
        <p>Enter origin and destination</p>
        <div layout-gt-sm="row">
          <md-autocomplete flex required
                           md-input-name="autoCmpltOriginField"
                           md-input-minlength="2"
                           md-input-maxlength="18"
                           md-no-cache="flightCtrl.noCache"
                           md-selected-item="flightCtrl.selectedItemOrigin"
                           md-search-text="flightCtrl.searchTextOrigin"
                           md-items="item in querySearch(flightCtrl.searchTextOrigin)"
                           md-item-text="item.iataCode"
                           md-require-match
                           md-floating-label="Origin">
            <md-item-template>
              <span md-highlight-text="flightCtrl.searchTextOrigin">{{item.iataCode}}</span>
            </md-item-template>
            <div ng-messages="searchForm.autoCmpltOriginField.$error" ng-if="searchForm.autoCmpltOriginField.$touched">
              <div ng-message="required">You <b>must</b> have a origin.</div>
              <div ng-message="md-require-match">Please select an existing state.</div>
              <div ng-message="minlength">Your entry is not long enough.</div>
              <div ng-message="maxlength">Your entry is too long.</div>
            </div>
          </md-autocomplete>
          <md-autocomplete flex required
                           md-input-name="autocompleteField"
                           md-input-minlength="2"
                           md-input-maxlength="18"
                           md-no-cache="flightCtrl.noCache"
                           md-selected-item="flightCtrl.selectedItem"
                           md-search-text="flightCtrl.searchText"
                           md-items="item in querySearch(flightCtrl.searchText)"
                           md-item-text="item.iataCode"
                           md-require-match
                           md-floating-label="Destination">
            <md-item-template>
              <span md-highlight-text="flightCtrl.searchText">{{item.iataCode}}</span>
            </md-item-template>
            <div ng-messages="searchForm.autocompleteField.$error" ng-if="searchForm.autocompleteField.$touched">
              <div ng-message="required">You <b>must</b> have a destination.</div>
              <div ng-message="md-require-match">Please select an existing state.</div>
              <div ng-message="minlength">Your entry is not long enough.</div>
              <div ng-message="maxlength">Your entry is too long.</div>
            </div>
          </md-autocomplete>
          <md-button ng-disabled="false" class="md-raised md-primary" ng-click="generateTable()">Search</md-button>
        </div>
    </md-content>

    <div class="panel-body">
      <table class="table table-bordered bordered table-striped table-condensed datatable" ui-jq="dataTable" ui-options="dataTableOpt" ng-show="IsVisible">
        <thead>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>Position</th>
          <%--<th>Office</th>
          <th>Age</th>
          <th>Start Date</th>--%>
        </tr>
        </thead>
        <tbody>
        <tr ng-repeat="n in data">
          <td>{{$index+1}}</td>
          <td>{{n[0]}}</td>
          <td>{{n[1]}}</td>
          <%--<td>{{n[2]}}</td>
          <td>{{n[3]}}</td>
          <td>{{n[4] | date:'dd/MM/yyyy'}}</td>--%>
        </tr>
        </tbody>
      </table>
    </div>

  </div>
</form>

</body>
</html>