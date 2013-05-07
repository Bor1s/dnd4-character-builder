@currentCharacter = 'hello'

#Controllers
@ResourcesCtrl = ($scope, Cls, Race, Character) ->
  unless @currentCharacter
    Character.save({}, (data)->
      @currentCharacter = data.character
    )

  $scope.classes = Cls.query()
  $scope.races = Race.query()
  $scope.updateRace = ()->
    for r in $scope.races
      _r = r if r._id == $scope.raceSelect
    
    Character.update(
      id: currentCharacter._id
      character:
        level: 1
        character_race_attributes:
          description: _r.description
          size: _r.size
          speed: _r.speed
          vision: _r.vision
          name: _r.name
    )

  $scope.updateClass = ()->
    'asdasd'

#Services
angular.module('raceServices', ['ngResource']).
  factory 'Race', ($resource)->
    $resource('/rest/races/:id', {format: 'json'},
      query:
        method: "GET"
        isArray: true
      get:
        method: "GET"
        params: {id: '@id'}
        isArray: false
    )

angular.module('classServices', ['ngResource']).
  factory 'Cls', ($resource)->
    $resource('/rest/classes.json', {},
      query:
        method: "GET"
        isArray: true)

angular.module('characterServices', ['ngResource']).
  factory 'Character', ($resource)->
    $resource('/rest/characters/:id', { format: 'json' },
      update:
        method: 'PUT'
        isArray: false
        params: {id: '@id'}
    )

#Router
angular.module('main', ['raceServices', 'classServices', 'characterServices']).
  config(['$routeProvider', ($routeProvider)->
    $routeProvider.
      when('/start', { templateUrl: 'assets/partials/start.html' }).
      when('/new_character', { templateUrl: 'assets/partials/new-character.html', controller: ResourcesCtrl }).
      otherwise({redirectTo: '/start'})
  ])
