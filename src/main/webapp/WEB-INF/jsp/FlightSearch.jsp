<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <!-- Angular Material style sheet -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angular_material/1.1.8/angular-material.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Angular Material requires Angular.js Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-animate.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-aria.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-messages.min.js"></script>

    <!-- Angular Material Library -->
    <script src="https://ajax.googleapis.com/ajax/libs/angular_material/1.1.8/angular-material.min.js"></script>

    <script src="js/flight/app.js"></script>
    <script src="js/flight/flightSearchCtrl.js"></script>
</head>
<body ng-controller="flightCtrl" data-ng-app="flightapp">
<form name="searchForm" ng-submit="$event.preventDefault()" >
<div ng-cloak>
    <md-content>
        <md-tabs md-dynamic-height md-border-bottom>
            <md-tab label="Flight Search">
                   <!-- <h1 class="md-display-2">Tab One</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla venenatis ante augue.
                    Phasellus volutpat neque ac dui mattis vulputate. Etiam consequat aliquam cursus. In sodales
                    pretium ultrices. Maecenas lectus est, sollicitudin consectetur felis nec, feugiat ultricies mi.</p>-->

                    <div layout="column" ng-cloak="" class="autocompletedemoFloatingLabel" >
                        <md-content class="md-padding">
                            <p>Enter origin and destination</p>
                            <div layout-gt-sm="row">
                                <md-autocomplete flex required
                                                 md-input-name="autoCmpltOriginField"
                                                 md-input-minlength="3"
                                                 md-input-maxlength="50"
                                                 md-no-cache="flightCtrl.noCache"
                                                 md-selected-item="flightCtrl.selectedItemOrigin"
                                                 md-search-text="flightCtrl.searchOrigin"
                                                 md-items="item in searchOrigin(flightCtrl.searchOrigin)"
                                                 md-item-text="item.airportName+ ' ,' + item.country+ ',' +item.iataCode "
                                                 md-require-match="true"
                                                 md-min-length="3"
                                                 md-autofocus="true"
                                                 md-autoselect="true"
                                                 md-floating-label="Origin">
                                    <md-item-template>
                                        <span md-highlight-text="flightCtrl.searchOrigin">{{item.airportName+ ',' + item.country +' ,' +item.iataCode }}</span>
                                    </md-item-template>
                                    <div ng-messages="searchForm.autoCmpltOriginField.$error" ng-if="searchForm.autoCmpltOriginField.$touched">
                                        <div ng-message="required">You <b>must</b> have a origin.</div>
                                        <div ng-message="md-require-match">Please select an existing origin.</div>
                                        <div ng-message="minlength">Your entry is not long enough.</div>
                                        <div ng-message="maxlength">Your entry is too long.</div>
                                    </div>
                                </md-autocomplete>
                                <md-autocomplete flex required
                                                 md-input-name="autocompleteField"
                                                 md-input-minlength="3"
                                                 md-input-maxlength="50"
                                                 md-no-cache="flightCtrl.noCache"
                                                 md-selected-item="flightCtrl.selectedItemDestination"
                                                 md-search-text="flightCtrl.searchDestination"
                                                 md-items="item in searchDestination(flightCtrl.searchDestination)"
                                                 md-item-text="item.airportName+ ' ,' + item.country+ ',' +item.iataCode "
                                                 md-require-match="true"
                                                 md-min-length="3"
                                                 md-autofocus="true"
                                                 md-autoselect="true"
                                                 md-floating-label="Destination">
                                    <md-item-template>
                                        <span md-highlight-text="flightCtrl.searchDestination">{{item.airportName+ ',' + item.country +' ,' +item.iataCode }}</span>
                                    </md-item-template>
                                    <div ng-messages="searchForm.autocompleteField.$error" ng-if="searchForm.autocompleteField.$touched">
                                        <div ng-message="required">You <b>must</b> have a destination.</div>
                                        <div ng-message="md-require-match">Please select an existing destination.</div>
                                        <div ng-message="minlength">Your entry is not long enough.</div>
                                        <div ng-message="maxlength">Your entry is too long.</div>
                                    </div>
                                </md-autocomplete>
                            </div>
                            <md-button ng-disabled="!(!!flightCtrl.selectedItemOrigin && !! flightCtrl.selectedItemDestination)" class="md-raised md-primary" ng-click="generateTable()">Search</md-button>
                        </md-content>



                        <div class="panel-body">
                            <table class="table table-bordered bordered table-striped table-condensed datatable" ui-jq="dataTable" ui-options="dataTableOpt" ng-show="IsVisible">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Origin</th>
                                    <th>Destination</th>
                                    <th>Fare (USD)</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="n in flightList">
                                    <td>{{$index+1}}</td>
                                    <td>{{n.origin}}</td>
                                    <td>{{n.destination}}</td>
                                    <td>{{n.fare}}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
            </md-tab>
            <md-tab label="Add Flights">
                <md-content class="md-padding">

                    <div layout="row">
                        <md-autocomplete flex required
                                         md-input-name="autoCmpltOriginAddField"
                                         md-input-minlength="3"
                                         md-input-maxlength="50"
                                         md-no-cache="flightCtrl.noCache"
                                         md-selected-item="flightCtrl.selectedAddOrigin"
                                         md-search-text="flightCtrl.searchAddOrigin"
                                         md-items="item in searchAddOrigin(flightCtrl.searchAddOrigin)"
                                         md-item-text="item.airportName+ ' ,' + item.country+ ' ,' +item.iataCode"
                                         md-require-match="true"
                                         md-min-length="3"
                                         md-autofocus="true"
                                         md-autoselect="true"
                                         md-floating-label="Origin">
                            <md-item-template>
                                <span md-highlight-text="flightCtrl.searchAddOrigin">{{item.airportName+ ',' + item.country +' ,' +item.iataCode  }}</span>
                            </md-item-template>
                            <div ng-messages="searchForm.autoCmpltOriginAddField.$error" ng-if="searchForm.autoCmpltOriginAddField.$touched">
                                <div ng-message="required">You <b>must</b> have a origin.</div>
                                <div ng-message="md-require-match">Please select an existing origin.</div>
                                <div ng-message="minlength">Your entry is not long enough.</div>
                                <div ng-message="maxlength">Your entry is too long.</div>
                            </div>
                        </md-autocomplete>

                        <md-autocomplete flex required
                                         md-input-name="autoCmpltOriginDesField"
                                         md-input-minlength="3"
                                         md-input-maxlength="50"
                                         md-no-cache="flightCtrl.noCache"
                                         md-selected-item="flightCtrl.selectedAddDest"
                                         md-search-text="flightCtrl.searchAddDest"
                                         md-items="item in searchAddDest(flightCtrl.searchAddDest)"
                                         md-item-text="item.airportName+ ' ,' + item.country+ ' ,' +item.iataCode "
                                         md-require-match="true"
                                         md-min-length="3"
                                         md-autofocus="true"
                                         md-autoselect="true"
                                         md-floating-label="Destination">
                            <md-item-template>
                                <span md-highlight-text="flightCtrl.searchAddDest">{{item.airportName+ ',' + item.country +' ,' +item.iataCode }}</span>
                            </md-item-template>
                            <div ng-messages="searchForm.autoCmpltOriginDesField.$error" ng-if="searchForm.autoCmpltOriginAddField.$touched">
                                <div ng-message="required">You <b>must</b> have a destination.</div>
                                <div ng-message="md-require-match">Please select an existing destination.</div>
                                <div ng-message="minlength">Your entry is not long enough.</div>
                                <div ng-message="maxlength">Your entry is too long.</div>
                            </div>
                        </md-autocomplete>
                    </div>


                    <md-input-container class="md-block">
                        <label>Fare (USD)</label>
                        <input required type="number"  name="fare" ng-model="fare"  ng-pattern="/^1234/" />

                        <div ng-messages="searchForm.fare.$error">
                            <div ng-message="required">
                                You've got to charge something! You can't just <b>give away</b> a Missile Defense
                                System.
                            </div>

                        </div>
                    </md-input-container>

                    <div>
                        <md-button ng-disabled="!(!!flightCtrl.selectedAddDest && !!flightCtrl.selectedAddOrigin)" class="md-raised md-primary" ng-click="addFlight()">Submit</md-button>
                    </div>

                </md-content>
            </md-tab>
        </md-tabs>
    </md-content>
</div>
</form>
</body>
</html>