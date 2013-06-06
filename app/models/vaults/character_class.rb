module Vaults::CharacterClass
  def self.included?(base)
    base.class.class_exec do
      [:cleric, :human].each do |race_name|
        define_method("#{race_name}?") do
          character_class.try(:name).try(:downcase) == race_name.to_s
        end
      end
    end

    delegate :hit_points_at_first_level, to: :character_class
    delegate :hit_points_per_level,      to: :character_class
    delegate :healing_surges_per_day,    to: :character_class
  end
end
