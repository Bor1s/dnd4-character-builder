class Character
  include ActiveModel::Validations

  attr_accessor :name, :age, :background, :alignment, :deities, :languages,
    :level, :expirience, :height, :weight, :gender, :ability_scores, :defences,
    :character_race, :character_class, :powers

  #NOTE: Character Race delegation
  delegate :height, to: :character_race
  delegate :weight, to: :character_race
  
  #NOTE: Ability score delegation
  delegate :strength, to: :ability_scores
  delegate :dexterity, to: :ability_scores
  delegate :wisdom, to: :ability_scores
  delegate :charisma, to: :ability_scores
  delegate :constitution, to: :ability_scores
  delegate :intelligence, to: :ability_scores
  
  #NOTE: Character Class delegation
  delegate :basic_hit_points, to: :character_class

  validates :name, length: { maximum: 50, minimum: 3 }

  def hit_points
  end

  def healing_surges
  end

  def healing_surge_value
  end

  def bloodied_value
  end

  def method_missing(meth_name, *args)
    if meth_name =~ /\A(.+)_modifier\z/
      AbilityScoreGenerator.send(:modifier_of, method($1.to_sym).call)
    end
  end

end
