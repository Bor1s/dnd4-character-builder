class AbilityScoreModifier
  def self.modifier_of(ability_score)
    raise "Ability score must be > 0" if ability_score < 1
    level_difference = 5
    balancer = ability_score.odd? ? 1 : 0
    ability_score - (ability_score / 2) - level_difference - balancer
  end
end
