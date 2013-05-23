@RaceCtrl = ($scope, Race, Character) ->
  unless window.currentCharacter
    Character.save({}, (data)->
      window.currentCharacter = data.character
    )
  $scope.races = Race.query()

  $scope.updateRace = ()->
    for r in $scope.races
      _r = r if r._id == $scope.raceSelect
    Character.update(
      id: currentCharacter._id
      character:
        level: 1
        character_race_attributes:
          description: _r.description
          size: _r.size
          speed: _r.speed
          vision: _r.vision
          name: _r.name
    )
