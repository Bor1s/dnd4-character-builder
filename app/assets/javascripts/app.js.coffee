window.currentCharacter = null

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
    for c in $scope.classes
      _c = c if c._id == $scope.classSelect
    Character.update(
      id: currentCharacter._id
      character:
        character_class_attributes:
          armor_proficiencies: _c.armor_proficiencies
          features: _c.features
          healing_surges_per_day: _c.healing_surges_per_day
          hit_points_at_first_level: _c.hit_points_at_first_level
          hit_points_per_level: _c.hit_points_per_level
          implement: _c.implement
          mandatory_trained_skills: _c.mandatory_trained_skills
          name: _c.name
          trained_skills_count: _c.trained_skills_count
          weapon_proficiencies: _c.weapon_proficiencies
    )

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
