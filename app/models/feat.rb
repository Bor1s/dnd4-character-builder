class Feat
  include Mongoid::Document
  embedded_in :character

  field :name, type: String
  field :prerequisites, type: String
  field :benefit, type: String

  module Extensions
    feat_names = Templates::Feat.all.map(&:name)
    feat_names.each do |fn|
      define_method "grant_access_to_#{fn}" do
        available_feats << fn
      end
    end
  end
end
