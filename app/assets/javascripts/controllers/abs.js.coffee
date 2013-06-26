@AbsCtrl = ($scope, $http, Character, $location, $rootScope) ->
  $http.get('/rest/ability_scores/names').success (data)->
    $scope.abilityScoresNames = data

  $http.get('/rest/ability_scores/custom_ability_scores').success (data)->
    $scope.spendPoints = data.ability_scores.spend_points

  $scope.str = $rootScope.currentCharacter.strength
  $scope.con = $rootScope.currentCharacter.constitution
  $scope.dex = $rootScope.currentCharacter.dexterity
  $scope.int = $rootScope.currentCharacter.intelligence
  $scope.wis = $rootScope.currentCharacter.wisdom
  $scope.cha = $rootScope.currentCharacter.charisma

  $scope.backToClass = ()->
    $location.path('/class')

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

  $scope.updateAbilityScores = ()->
    Character.update(
      stage: 4
      id: $rootScope.currentCharacter._id
      character:
        strength: $scope.str
        dexterity: $scope.dex
        constitution: $scope.con
        charisma: $scope.cha
        intelligence: $scope.int
        wisdom: $scope.wis
      (data) ->
        $rootScope.currentCharacter = data.character
        $location.path('/skills')
      () ->
        alert 'Fail :('
    )
