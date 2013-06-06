class Feat
  include Mongoid::Document

  field :name, type: String
  field :prerequisite, type: String
  field :benefit, type: String
  field :available, type: Boolean, default: false
  field :used, type: Boolean, default: false

  scope :available, where(available: true)
  
  module Extensions
    def self.included(base)
      base.extend(Extensions::ClassMethods)
    end

    module ClassMethods
      def feat_names
        Feat.all.map(&:name)
      end
    end
  end
end
