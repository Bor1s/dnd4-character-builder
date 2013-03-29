class Templates::Skill
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :keyword, type: String

  module Extensions
    [:acrobatics, :arcana, :athletics, :bluff,
     :diplomacy, :dungeoneering, :endurance, :heal,
     :history, :insight, :intimidate,
     :nature, :perception, :religion,
     :stealth, :streetwise, :thievery].each do |meth|
      define_method meth do
        skills.where(keyword: meth.to_s).first.try(:value)
      end

      define_method "#{meth}=" do |arg|
        skills.where(keyword: meth.to_s).first.write_attribute(:value, arg)
      end
    end
  end
end
