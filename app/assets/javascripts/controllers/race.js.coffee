@RaceCtrl = ($scope, Race, Character, $location, $rootScope) ->
  $scope.races = Race.query(
    {}
    ()->
      $scope.raceId = $rootScope.currentCharacter.race_id
  )

  $scope.updateRace = ()->
    Character.update(
      stage: 2
      id: $rootScope.currentCharacter._id
      character:
        race_id: $scope.raceId
      (data) ->
        $rootScope.currentCharacter = data.character
        $location.path('/class')
      () ->
        alert 'Fail :('
    )

  $scope.backToLevel = ()->
    $location.path('/level')
