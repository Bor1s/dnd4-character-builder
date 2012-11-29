class Character
  include ActiveModel::Validations

  attr_accessor :name, :age, :background, :alignment, :deities, :languages,
    :level, :expirience, :height, :weight, :gender, :ability_scores, :defences,
    :character_race, :powers

  delegate :height, to: :character_race
  delegate :weight, to: :character_race

  validates :name, length: { maximum: 50, minimum: 3 }

  def hit_points
  end

  def healing_surges
  end

  def healing_surge_value
  end

  def bloodied_value
  end

end
