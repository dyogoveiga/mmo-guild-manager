class Klass
  class Weapon
    class_attribute :instances, default: []

    def self.by_name(name)
      self.instances.detect { |instance| instance.name == name }
    end

    def self.all
      self.instances
    end

    attr_reader :name

    def initialize(name: nil)
      validate_uniqueness_of_name(name)

      @name = name
      self.instances << self
    end

    private

    def validate_uniqueness_of_name(name)
      return unless self.class.by_name(name)

      raise ArgumentError, "#{self.class.name} name must be unique"
    end
  end
end
