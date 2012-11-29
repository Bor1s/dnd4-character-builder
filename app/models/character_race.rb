class CharacterRace
  attr_accessor :name, :description, :height, :weight,
    :ability_scores_bonuses, :size, :vision, :speed, :skill_bonuses,
    :languages, :traits, :powers

  def bonuses_for_keyword(keyword)
    traits.select { |t| t[:keyword] == keyword }.sum { |t| eval(t[:bonus], binding).call }
  end
end
