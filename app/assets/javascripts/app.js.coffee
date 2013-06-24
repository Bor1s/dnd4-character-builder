#Router
angular.module('main', ['raceServices', 'classServices', 'characterServices']).
  config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider)->
    $locationProvider.html5Mode(true)
    $routeProvider.
      when('/start', { templateUrl: '/assets/partials/start.html', controller: BaseCtrl }).
      when('/select_character', { templateUrl: '/assets/partials/select-character.html', controller: BaseCtrl }).
      when('/level', { templateUrl: '/assets/partials/level.html', controller: LevelCtrl }).
      when('/race', { templateUrl: '/assets/partials/race.html', controller: RaceCtrl }).
      when('/class', { templateUrl: '/assets/partials/class.html', controller: ClassCtrl}).
      when('/ability_scores', { templateUrl: '/assets/partials/ability_scores.html', controller: AbsCtrl}).
      otherwise({redirectTo: '/start'})
  ])
