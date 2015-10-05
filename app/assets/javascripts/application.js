// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//= require angular
//= require angular-resource

angular.module('app', ['ngResource']).
  factory('SumOperation', function($resource) {
    return $resource('/api_example_1', {}, {
      calc: { cache: true, method: 'POST' }
    });
  }).
  controller('Calculator', function($scope, $http, SumOperation) {
    $scope.calc = function(a, b) {
      var op = new SumOperation({ "a": a, "b": b });
      window.op = op;
      op.$calc().then(function(result) {
        $scope.result = result.result;
      });
    };
  });