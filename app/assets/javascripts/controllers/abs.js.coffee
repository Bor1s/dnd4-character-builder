@AbsCtrl = ($scope, $http, Character) ->
  $http.get('rest/ability_scores/names').success (data)->
    $scope.abilityScoresNames = data

  $scope.gtypes =
    [
      { id: 1, name: "Standard Array", url: "rest/ability_scores/standard_array" },
      { id: 2, name: "Random", url: "rest/ability_scores/roll_ability_scores" },
      { id: 3, name: "Custom", url: "rest/ability_scores/custom_ability_scores" }
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

  $scope.changeStr = (value)->
    _from = parseInt($scope.str)
    _to   = parseInt($scope.str) + value
    $http.get("rest/ability_scores/score_cost/" + _from + "/" + _to).success (data) ->
      unless data.error
        if value == -1
          $scope.spendPoints = $scope.spendPoints + parseInt(data.cost)
          $scope.str = $scope.str + value
        else
          unless data.cost > $scope.spendPoints
            $scope.spendPoints = $scope.spendPoints - parseInt(data.cost)
            $scope.str = $scope.str + value
  
  $scope.changeCon = (value)->
    _from = parseInt($scope.con)
    _to   = parseInt($scope.con) + value
    $http.get("rest/ability_scores/score_cost/" + _from + "/" + _to).success (data) ->
      unless data.error
        if value == -1
          $scope.spendPoints = $scope.spendPoints + parseInt(data.cost)
          $scope.con = $scope.con + value
        else
          unless data.cost > $scope.spendPoints
            $scope.spendPoints = $scope.spendPoints - parseInt(data.cost)
            $scope.con = $scope.con + value

  $scope.changeDex = (value)->
    _from = parseInt($scope.dex)
    _to   = parseInt($scope.dex) + value
    $http.get("rest/ability_scores/score_cost/" + _from + "/" + _to).success (data) ->
      unless data.error
        if value == -1
          $scope.spendPoints = $scope.spendPoints + parseInt(data.cost)
          $scope.dex = $scope.dex + value
        else
          unless data.cost > $scope.spendPoints
            $scope.spendPoints = $scope.spendPoints - parseInt(data.cost)
            $scope.dex = $scope.dex + value

  $scope.changeInt = (value)->
    _from = parseInt($scope.int)
    _to   = parseInt($scope.int) + value
    $http.get("rest/ability_scores/score_cost/" + _from + "/" + _to).success (data) ->
      unless data.error
        if value == -1
          $scope.spendPoints = $scope.spendPoints + parseInt(data.cost)
          $scope.int = $scope.int + value
        else
          unless data.cost > $scope.spendPoints
            $scope.spendPoints = $scope.spendPoints - parseInt(data.cost)
            $scope.int = $scope.int + value

  $scope.changeWis = (value)->
    _from = parseInt($scope.wis)
    _to   = parseInt($scope.wis) + value
    $http.get("rest/ability_scores/score_cost/" + _from + "/" + _to).success (data) ->
      unless data.error
        if value == -1
          $scope.spendPoints = $scope.spendPoints + parseInt(data.cost)
          $scope.wis = $scope.wis + value
        else
          unless data.cost > $scope.spendPoints
            $scope.spendPoints = $scope.spendPoints - parseInt(data.cost)
            $scope.wis = $scope.wis + value

  $scope.changeCha = (value)->
    _from = parseInt($scope.cha)
    _to   = parseInt($scope.cha) + value
    $http.get("rest/ability_scores/score_cost/" + _from + "/" + _to).success (data) ->
      unless data.error
        if value == -1
          $scope.spendPoints = $scope.spendPoints + parseInt(data.cost)
          $scope.cha = $scope.cha + value
        else
          unless data.cost > $scope.spendPoints
            $scope.spendPoints = $scope.spendPoints - parseInt(data.cost)
            $scope.cha = $scope.cha + value
