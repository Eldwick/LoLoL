// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
//= require_self
//= require_tree ./services
//= require_tree ./filters
//= require_tree ./controllers
//= require_tree ./directives


var myApp = angular.module('myApp', ['ui.router']);

myApp.
  config(['$urlRouterProvider', '$stateProvider', function($urlRouterProvider, $stateProvider){
    $urlRouterProvider.otherwise('/');

    $stateProvider.
      state('tasksDue', {
        url: '/test',
        templateUrl: '/templates/tasksDue.html',
        controller: 'itemsControllerNgInit'
      })
  }]);

myApp.controller('GreetingController', ['$scope', function($scope) {
  $scope.title = 'Hola!';
}]);

myApp.controller('itemsControllerNgInit', ['$scope', function($scope) {
  $scope.init = function(lists) {
      $scope.lists = lists
    }

    $scope.title = "yo bro"

  var logSomeStuff = function(call) {
    console.log($scope.list);
  }
     
   $scope.$evalAsync(logSomeStuff);
}]);

myApp.filter('titleFormatted', function() {
      return function(title) {
        formatted = title.replace(/^\s+|\s+$/g, "").replace(/ /gi, "_")
        return formatted;
      }
    }
  );