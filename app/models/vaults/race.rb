module Vaults::Race
  def self.included?(base)
    base.class.class_eval do
      def dragonborn?
        race.name.downcase == 'dragonborn'
      end
    end
  end
end
