class DbDumper
  class << self

    def dump(dump_class_name = Rule)
      _name = dump_class_name.name.downcase.pluralize
      File.open(Rails.root.join('tmp', "#{_name}_dump.yml"), 'w') do |f|
        objects = dump_class_name.all.map do |obj|
          obj.attributes.except(:_id, :created_at, :updated_at)
        end
        puts "Dumping #{objects.size} #{_name} ..."
        YAML.dump(objects, f)
        puts "Dumped."
      end
    end

    def load(class_name)
      file = File.open(Rails.root.join('tmp', "#{class_name.name.downcase.pluralize}_dump.yml"))
      objects = YAML.load(file)
      objects.each do |obj|
        class_name.new.tap do |o|
          o.attributes = obj.except("_id")
        end.save
      end
    end
  end
end
