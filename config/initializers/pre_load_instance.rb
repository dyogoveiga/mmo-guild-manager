require_dependency Rails.root.join("app/entities/klass")
require_dependency Rails.root.join("app/entities/klass/role")
require_dependency Rails.root.join("app/entities/klass/weapon")

file_path = Rails.root.join("config", "constants", "character.yml")
structure = YAML.load_file(file_path.to_s)
roles = structure.dig("character", "roles")
weapons = structure.dig("character", "weapons")
klasses = structure.dig("character", "klasses")

roles.each { |role| Klass::Role.new(name: role) }
weapons.each { |weapon| Klass::Weapon.new(name: weapon) }

klasses.each do |klass, weapons|
  Klass.new(
    name: klass,
    main_weapon: Klass::Weapon.by_name(weapons["main_weapon"]),
    offhand: Klass::Weapon.by_name(weapons["offhand"])
  )
end
