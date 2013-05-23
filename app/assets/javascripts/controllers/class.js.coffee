@ClassCtrl = ($scope, Cls, Character) ->
  $scope.classes = Cls.query()

  $scope.updateClass = ()->
    for c in $scope.classes
      _c = c if c._id == $scope.classSelect
    Character.update(
      id: currentCharacter._id
      character:
        character_class_attributes:
          armor_proficiencies: _c.armor_proficiencies
          features: _c.features
          healing_surges_per_day: _c.healing_surges_per_day
          hit_points_at_first_level: _c.hit_points_at_first_level
          hit_points_per_level: _c.hit_points_per_level
          implement: _c.implement
          mandatory_trained_skills: _c.mandatory_trained_skills
          name: _c.name
          trained_skills_count: _c.trained_skills_count
          weapon_proficiencies: _c.weapon_proficiencies
    )
