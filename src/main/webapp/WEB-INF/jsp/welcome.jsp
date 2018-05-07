<!DOCTYPE html>
<html>
<script
        src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js">
</script>
<body>
<h2>AngularJS Ajax $http service example.</h2>
<div ng-app="testApp" ng-controller="appCtrl">
    <h3>{{message}}</h3>
</div>

<script>
    var app = angular.module('testApp', []);
    app.controller('appCtrl', function($scope, $http) {
        $http.get("/responseBody")
            .then(function(response) {
                $scope.message= response.data;
            });
    });
</script>

</body>
</html>





<!DOCTYPE html>
<html>

<link href="css/bootstrap.css" rel="stylesheet"/>
<%--<link href="css/app.css" rel="stylesheet"/>--%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
<body>

<div ng-app="flightSearchApp">

    <md-content class="md-padding" ng-controller="flightSearchCtrl" layout="column" ng-cloak>
        <form ng-submit="$event.preventDefault()" name="searchForm">
            <div layout-gt-sm="row">
                <md-input-container flex>
                    <label>Origin</label>
                    <input type="text"/>
                </md-input-container>
                <md-autocomplete flex required
                                 md-input-name="autocompleteField"
                                 md-input-minlength="2"
                                 md-input-maxlength="18"
                                 md-no-cache="flightSearchCtrl.noCache"
                                 md-selected-item="flightSearchCtrl.selectedItem"
                                 md-search-text="flightSearchCtrl.searchText"
                                 md-items="item in flightSearchCtrl.querySearch(flightSearchCtrl.searchText)"
                                 md-item-text="item.display"
                                 md-require-match
                                 md-floating-label="Favorite state">
                    <md-item-template>
                        <span md-highlight-text="flightSearchCtrl.searchText">{{item.display}}</span>
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

<%--<!DOCTYPE html>

<html lang="en" ng-app="flightSearchApp">
<head>
    <title>${title}</title>
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/app.css" rel="stylesheet"/>
</head>
<body>

<div ui-view></div>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
&lt;%&ndash;<script src="js/lib/localforage.min.js" ></script>
<script src="js/lib/ngStorage.min.js"></script>&ndash;%&gt;
&lt;%&ndash;<script src="js/app/app.js"></script>
<script src="js/app/UserService.js"></script>
<script src="js/app/UserController.js"></script>&ndash;%&gt;
</body>
</html>--%>

<%-- <table>
     <tr ng-repeat="x in names">
         <td>{{ x.id }}</td>
         <td>{{ x.content }}</td>
     </tr>
 </table>--%>
<%--


       <div class="generic-container">
           <div class="panel panel-default">
               <div class="panel-body">
                   <div class="formcontainer">
                       <div class="alert alert-success" role="alert" ng-if="ctrl.successMessage">{{ctrl.successMessage}}</div>
                       <div class="alert alert-danger" role="alert" ng-if="ctrl.errorMessage">{{ctrl.errorMessage}}</div>
                       <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                           <div class="row">
                               <div class="form-group col-md-12">
                                   <label class="col-md-2 control-lable" for="origin">Origin</label>
                                   <div class="col-md-7">
                                       <input type="text" ng-model="ctrl.origin.id" id="origin" class="username form-control input-sm" placeholder="Enter origin" required ng-minlength="3"/>
                                   </div>
                               </div>
                           </div>

                           <div class="row">
                               <div class="form-group col-md-12">
                                   <label class="col-md-2 control-lable" for="destination">Destination</label>
                                   <div class="col-md-7">
                                       <input type="text" ng-model="ctrl.destination.id" id="destination" class="form-control input-sm" placeholder="Enter Destination." required ng-minlength="3"/>
                                   </div>
                               </div>
                           </div>

                           <div class="row">
                               <div class="form-actions col-md-12 floatRight">
                                   <div class="col-md-7">
                                   <input type="submit"  value="Search" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                                   &lt;%&ndash;<button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>&ndash;%&gt;
                                   </div>
                               </div>
                           </div>
                       </form>
                   </div>
               </div>
           <div class="panel panel-default">
               <!-- Default panel contents -->
               <div class="panel-heading"><span class="lead">List of Users </span></div>
               <div class="panel-body">
                   <div class="table-responsive">
                       <table class="table table-hover">
                           <thead>
                           <tr>
                               <th>ID</th>
                               <th>NAME</th>
                               <th>AGE</th>
                               <th>SALARY</th>
                               <th width="100"></th>
                               <th width="100"></th>
                           </tr>
                           </thead>
                           <tbody>
                           <tr ng-repeat="u in ctrl.getAllUsers()">
                               <td>{{u.id}}</td>
                               <td>{{u.name}}</td>
                               <td>{{u.age}}</td>
                               <td>{{u.salary}}</td>
                               <td><button type="button" ng-click="ctrl.editUser(u.id)" class="btn btn-success custom-width">Edit</button></td>
                               <td><button type="button" ng-click="ctrl.removeUser(u.id)" class="btn btn-danger custom-width">Remove</button></td>
                           </tr>
                           </tbody>
                       </table>
                   </div>
               </div>
           </div>
       </div>

--%>

<%--
<script>
    var app = angular.module('flightSearchApp', []);
    app.controller('flightSearchCtrl', function($scope, $http) {
        $http.get("/getSearchResults")
            .then(function (response) {$scope.names = response.data.records;});
    });
</script>
--%>
<script>
    /*(function () {
    'use strict';
    angular
    .module('flightSearchApp', ['ngMaterial', 'ngMessages'])
    .controller('flightSearchCtrl', flightSearchCtrl);

    function flightSearchCtrl ($timeout, $q) {
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
    }
    })();*/
</script>
