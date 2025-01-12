class Klass
  class_attribute :instances, default: []

  def self.by_name(name)
    self.instances.detect { |instance| instance.name == name }
  end

  def self.by_weapon_names(main_weapon: nil, offhand: nil)
    self.instances.detect do |instance|
      ([ main_weapon, offhand ] - [ instance.main_weapon.name, instance.offhand.name ]).empty?
    end
  end

  def self.all
    self.instances
  end

  attr_reader :name, :main_weapon, :offhand

  def initialize(name: nil, main_weapon: nil, offhand: nil)
    validate_uniqueness_of_name(name)

    @name = name
    @main_weapon = main_weapon
    @offhand = offhand

    self.instances << self
  end

  def weapons_name
    [ main_weapon.name, offhand.name ].join("/")
  end

  private

  def validate_uniqueness_of_name(name)
    return unless self.class.by_name(name)

    raise ArgumentError, "Klass name must be unique"
  end
end
