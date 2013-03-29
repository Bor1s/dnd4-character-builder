class Templates::Feat
  include Mongoid::Document

  field :name, type: String
  field :prerequisite, type: String
  field :benefit, type: String

  module ClassMethods
    def feat_names
      Templates::Feat.all.map(&:name)
    end
  end
end
