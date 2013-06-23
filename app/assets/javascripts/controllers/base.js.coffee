@BaseCtrl = ($scope, Character, $location, $rootScope) ->
  $scope.newCharacter = ()->
    Character.save(
      {}
      (data)->
        $rootScope.currentCharacter = data.character
    )
    $location.path('/new_character')
