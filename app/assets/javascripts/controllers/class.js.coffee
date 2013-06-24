@ClassCtrl = ($scope, Cls, Character, $location, $rootScope) ->
  $scope.classes = Cls.query(
    {}
    ()->
      $scope.classId = $rootScope.currentCharacter.character_class_id
  )

  $scope.updateClass = ()->
    Character.update(
      stage: 3
      id: $rootScope.currentCharacter._id
      character:
        character_class_id: $scope.classId
      (data) ->
        $rootScope.currentCharacter = data.character
        $location.path('/ability_scores')
      () ->
        alert 'Fail :('
    )

  $scope.backToRace = ()->
    $location.path('/race')
