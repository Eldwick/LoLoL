// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
//= require_self

var myApp = angular.module('LoLoL', []);


myApp.controller('searchListCtrl', ['$scope', function($scope) {
  $scope.init = function(lists) {
      $scope.lists = lists
    }
    $scope.text = 'hi'
}]);

myApp.filter('titleFormatted', function() {
      return function(title) {
        formatted = title.replace(/^\s+|\s+$/g, "").replace(/ /gi, "_")
        return formatted;
      }
    }
  );