@AbsCtrl = ($scope, $http, Character) ->
  $http.get('/rest/ability_scores/names').success (data)->
    $scope.abilityScoresNames = data

  $scope.gtypes =
    [
      { id: 1, name: "Standard Array", url: "/rest/ability_scores/standard_array" },
      { id: 2, name: "Random", url: "/rest/ability_scores/roll_ability_scores" },
      { id: 3, name: "Custom", url: "/rest/ability_scores/custom_ability_scores" }
    ]

  $scope._setAbilityScoresValues = (scores)->
    $scope.str = scores[0]
    $scope.con = scores[1]
    $scope.dex = scores[2]
    $scope.int = scores[3]
    $scope.wis = scores[4]
    $scope.cha = scores[5]

  $scope.generateScores = ()->
    _el = $scope.gtypes.filter (obj) ->
      parseInt(obj.id) == parseInt($scope.scoreType)

    $http.get(_el[0].url).success (data)->
      if data.ability_scores instanceof Array
        $scope.scoreArray = data.ability_scores
      else
        $scope.spendPoints = data.ability_scores.spend_points
        $scope.scoreArray  = data.ability_scores.scores
      $scope._setAbilityScoresValues($scope.scoreArray)

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
      id: currentCharacter._id
      character:
        strength: $scope.str
        dexterity: $scope.dex
        constitution: $scope.con
        charisma: $scope.cha
        intelligence: $scope.int
        wisdom: $scope.wis
    )
