class Character
  include ActiveModel::Validations

  attr_accessor :name, :age, :background, :alignment, :deities, :languages,
    :level, :expirience, :height, :weight, :gender, :ability_scores, :defences

  validates :name, length: { maximum: 50, minimum: 3 }
end
