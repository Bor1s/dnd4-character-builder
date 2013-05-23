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
