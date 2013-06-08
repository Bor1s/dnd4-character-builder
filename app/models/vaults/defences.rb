module Vaults::Defences
  def self.included(base)
    base.class_exec do
      field :fortitude, type: Integer
      field :will, type: Integer
      field :armor_class, type: Integer
      field :reflex, type: Integer
    end
  end
end
