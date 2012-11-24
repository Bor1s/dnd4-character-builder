class Character
  include ActiveModel::Validations

  attr_accessor :name, :age, :background, :alignment, :deities, :languages,
    :level, :expirience, :height, :weight, :gender, :ability_scores, :defences, :character_race

  validates :name, length: { maximum: 50, minimum: 3 }

  def hit_points
    eval(Rule.hit_points.formula, binding).call
  end

  def healing_surges
    eval(Rule.healing_surges.formula, binding).call
  end

  def healing_surge_value
    eval(Rule.healing_surge_value.formula, binding).call + character_race.bonuses_for_keyword(__method__)
  end

  def bloodied_value
    eval(Rule.bloodied_value.formula, binding).call
  end

end
