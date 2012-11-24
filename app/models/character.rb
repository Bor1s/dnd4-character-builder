class Character
  include ActiveModel::Validations

  attr_accessor :name, :age, :background, :alignment, :deities, :languages,
    :level, :expirience, :height, :weight, :gender, :ability_scores, :defences,
    :healing_surges, :hit_points, :bloodied_value

  validates :name, length: { maximum: 50, minimum: 3 }

  protected

  def get_binding
    binding
  end
end
