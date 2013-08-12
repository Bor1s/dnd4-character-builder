@BaseCtrl = ($scope, $http, Character, Cls, Race, $location, $rootScope) ->
  # Character storage
  $scope.currentCharacter = null

  # Get list of characters
  $scope.characters = Character.query()
  
  # Levels
  $scope.levels = [1..30]
  #$scope.level = $scope.currentCharacter.level

  # Get all classes
  $scope.classes = Cls.query({}, ()->
    #$scope.classId = $scope.currentCharacter.character_class_id
  )

  # Get all races
  $scope.races = Race.query({}, ()->
    #$scope.raceId = $scope.currentCharacter.race_id
  )

  # Selecting and createting character
  $scope.newCharacter = ()->
    Character.save({}, (data)->
      $rootScope.currentCharacter = data.character
    )

  $scope.selectCharacter = ()->
    _characters = $scope.characters.filter (c)->
      c._id == $scope.characterId
    $scope.currentCharacter = _characters[0]
    $location.path('/level')

  # Updating character attributes
  $scope.updateLevel = ()->
    Character.update(
      stage: 1
      id: $rootScope.currentCharacter._id
      character:
        level: $scope.level
      (data) ->
        $rootScope.currentCharacter = data.character
      () ->
        alert 'Fail :('
    )

  $scope.updateClass = ()->
    Character.update(
      stage: 3
      id: $scope.currentCharacter._id
      character:
        character_class_id: $scope.classId
      (data) ->
        $scope.currentCharacter = data.character
        $location.path('/ability_scores')
      () ->
        alert 'Fail :('
    )
  
  $scope.updateRace = ()->
    Character.update(
      stage: 2
      id: $rootScope.currentCharacter._id
      character:
        race_id: $scope.raceId
      (data) ->
        $rootScope.currentCharacter = data.character
      () ->
        alert 'Fail :('
    )

  $scope.updateAbilityScores = ()->
    Character.update(
      stage: 4
      id: $scope.currentCharacter._id
      character:
        strength: $scope.str
        dexterity: $scope.dex
        constitution: $scope.con
        charisma: $scope.cha
        intelligence: $scope.int
        wisdom: $scope.wis
      (data) ->
        $scope.currentCharacter = data.character
        $location.path('/skills')
      () ->
        alert 'Fail :('
    )

  # Ability scores
  $http.get('/rest/ability_scores/names').success (data)->
    $scope.abilityScoresNames = data

  $http.get('/rest/ability_scores/custom_ability_scores').success (data)->
    $scope.spendPoints = data.ability_scores.spend_points

  #$scope.str = $rootScope.currentCharacter.strength
  #$scope.con = $rootScope.currentCharacter.constitution
  #$scope.dex = $rootScope.currentCharacter.dexterity
  #$scope.int = $rootScope.currentCharacter.intelligence
  #$scope.wis = $rootScope.currentCharacter.wisdom
  #$scope.cha = $rootScope.currentCharacter.charisma

  $scope.changeAs = (value, ng_model)->
    _from = parseInt($scope[ng_model])
    _to   = parseInt($scope[ng_model]) + value
    $http.get("/rest/ability_scores/score_cost/" + _from + "/" + _to).success (data) ->
      unless data.error
        if value == -1
          $scope.spendPoints = $scope.spendPoints + parseInt(data.cost)
          $scope[ng_model] = $scope[ng_model] + value
        else
          unless data.cost > $scope.spendPoints
            $scope.spendPoints = $scope.spendPoints - parseInt(data.cost)
            $scope[ng_model] = $scope[ng_model] + value
