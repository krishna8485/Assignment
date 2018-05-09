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
                                                 md-input-maxlength="40"
                                                 md-no-cache="flightCtrl.noCache"
                                                 md-selected-item="flightCtrl.selectedItemOrigin"
                                                 md-search-text="flightCtrl.searchOrigin"
                                                 md-items="item in searchOrigin(flightCtrl.searchOrigin)"
                                                 md-item-text="item.airportName+ ' ,' + item.country+ '(' +item.iataCode +')'"
                                                 md-require-match="true"
                                                 md-min-length="3"
                                                 md-autofocus="true"
                                                 md-autoselect="true"
                                                 md-floating-label="Origin">
                                    <md-item-template>
                                        <span md-highlight-text="flightCtrl.searchOrigin">{{item.airportName+ ',' + item.country +'(' +item.iataCode+')' }}</span>
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
                                                 md-input-maxlength="40"
                                                 md-no-cache="flightCtrl.noCache"
                                                 md-selected-item="flightCtrl.selectedItemDestination"
                                                 md-search-text="flightCtrl.searchDestination"
                                                 md-items="item in searchDestination(flightCtrl.searchDestination)"
                                                 md-item-text="item.airportName+ ' ,' + item.country+ '(' +item.iataCode +')'"
                                                 md-require-match="true"
                                                 md-min-length="3"
                                                 md-autofocus="true"
                                                 md-autoselect="true"
                                                 md-floating-label="Destination">
                                    <md-item-template>
                                        <span md-highlight-text="flightCtrl.searchDestination">{{item.airportName+ ',' + item.country +'(' +item.iataCode+')'}}</span>
                                    </md-item-template>
                                    <div ng-messages="searchForm.autocompleteField.$error" ng-if="searchForm.autocompleteField.$touched">
                                        <div ng-message="required">You <b>must</b> have a destination.</div>
                                        <div ng-message="md-require-match">Please select an existing destination.</div>
                                        <div ng-message="minlength">Your entry is not long enough.</div>
                                        <div ng-message="maxlength">Your entry is too long.</div>
                                    </div>
                                </md-autocomplete>
                                <md-button ng-disabled="!(!!flightCtrl.searchDestination && !! flightCtrl.searchOrigin)" class="md-raised md-primary" ng-click="generateTable()">Search</md-button>
                            </div>
                        </md-content>

                        <div class="panel-body">
                            <table class="table table-bordered bordered table-striped table-condensed datatable" ui-jq="dataTable" ui-options="dataTableOpt" ng-show="IsVisible">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Origin</th>
                                    <th>Destination</th>
                                    <th>Fare</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="n in data">
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
                    <h1 class="md-display-2">Add Flights Tab</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla venenatis ante augue. Phasellus volutpat neque ac dui mattis vulputate. Etiam consequat aliquam cursus. In sodales pretium ultrices. Maecenas lectus est, sollicitudin consectetur felis nec, feugiat ultricies mi. Aliquam erat volutpat. Nam placerat, tortor in ultrices porttitor, orci enim rutrum enim, vel tempor sapien arcu a tellus. Vivamus convallis sodales ante varius gravida. Curabitur a purus vel augue ultrices ultricies id a nisl. Nullam malesuada consequat diam, a facilisis tortor volutpat et. Sed urna dolor, aliquet vitae posuere vulputate, euismod ac lorem. Sed felis risus, pulvinar at interdum quis, vehicula sed odio. Phasellus in enim venenatis, iaculis tortor eu, bibendum ante. Donec ac tellus dictum neque volutpat blandit. Praesent efficitur faucibus risus, ac auctor purus porttitor vitae. Phasellus ornare dui nec orci posuere, nec luctus mauris semper.</p>
                    <p>Morbi viverra, ante vel aliquet tincidunt, leo dolor pharetra quam, at semper massa orci nec magna. Donec posuere nec sapien sed laoreet. Etiam cursus nunc in condimentum facilisis. Etiam in tempor tortor. Vivamus faucibus egestas enim, at convallis diam pulvinar vel. Cras ac orci eget nisi maximus cursus. Nunc urna libero, viverra sit amet nisl at, hendrerit tempor turpis. Maecenas facilisis convallis mi vel tempor. Nullam vitae nunc leo. Cras sed nisl consectetur, rhoncus sapien sit amet, tempus sapien.</p>
                    <p>Integer turpis erat, porttitor vitae mi faucibus, laoreet interdum tellus. Curabitur posuere molestie dictum. Morbi eget congue risus, quis rhoncus quam. Suspendisse vitae hendrerit erat, at posuere mi. Cras eu fermentum nunc. Sed id ante eu orci commodo volutpat non ac est. Praesent ligula diam, congue eu enim scelerisque, finibus commodo lectus.</p>
                </md-content>
            </md-tab>
        </md-tabs>
    </md-content>
</div>

</body>
</html>