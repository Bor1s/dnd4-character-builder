@LevelCtrl = ($scope, Character, $location, $rootScope) ->

  $scope.levels = [1..30]
  $scope.level = $rootScope.currentCharacter.level

  $scope.updateLevel = ()->
    Character.update(
      stage: 1
      id: $rootScope.currentCharacter._id
      character:
        level: $scope.level
      (data) ->
        $rootScope.currentCharacter = data.character
        $location.path('/race')
      () ->
        alert 'Fail :('
    )
