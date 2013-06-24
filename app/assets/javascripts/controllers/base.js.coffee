@BaseCtrl = ($scope, Character, $location, $rootScope) ->
  $scope.characters = Character.query()

  $scope.newCharacter = ()->
    Character.save(
      {}
      (data)->
        $rootScope.currentCharacter = data.character
    )
    $location.path('/level')

  $scope.selectCharacter = ()->
    _characters = $scope.characters.filter (c)->
      c._id == $scope.characterId
    $rootScope.currentCharacter = _characters[0]
    $location.path('/level')
