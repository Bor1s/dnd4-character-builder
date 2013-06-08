module Vaults::Skills
  def self.included(base)
    base.class_exec do
      field :acrobatics, type: Integer
      field :arcana, type: Integer
      field :athletics, type: Integer
      field :bluff, type: Integer
      field :diplomacy, type: Integer
      field :dungeoneering, type: Integer
      field :endurance, type: Integer
      field :heal, type: Integer
      field :history, type: Integer
      field :insight, type: Integer
      field :intimidate, type: Integer
      field :nature, type: Integer
      field :perception, type: Integer
      field :religion, type: Integer
      field :stealth, type: Integer
      field :streetwise, type: Integer
      field :thievery, type: Integer
    end
  end
end
