class RuleMapper
  include Mongoid::Document

  field :name, type: String
  field :store_as, type: String
  field :method_list, type: Array

  def self.store(rule)
    unless RuleMapper.where(name: rule.name).first
      mapper = RuleMapper.new
      mapper.name = rule.name
      mapper.store_as = rule.todo["store_as"]
      mapper.method_list = extract_methods_from(rule.todo["what"])
      mapper.save!
    end
  end

  private

  def self.extract_methods_from(string)
    _found_methods = string.scan /{([^{}]+)}/ 
    _found_methods.flatten.map(&:to_sym)
  end
end
