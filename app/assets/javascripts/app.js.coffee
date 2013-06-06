window.currentCharacter = null

#Router
angular.module('main', ['raceServices', 'classServices', 'characterServices']).
  config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider)->
    $locationProvider.html5Mode(true)
    $routeProvider.
      when('/start', { templateUrl: '/assets/partials/start.html' }).
      when('/new_character', { templateUrl: '/assets/partials/new-character.html'}).
      when('/new_character/race', { templateUrl: '/assets/partials/race.html', controller: RaceCtrl }).
      when('/new_character/class', { templateUrl: '/assets/partials/class.html', controller: ClassCtrl}).
      when('/new_character/ability_scores', { templateUrl: '/assets/partials/ability_scores.html', controller: AbsCtrl}).
      otherwise({redirectTo: '/start'})
  ])
