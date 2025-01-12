module ApplicationHelper
  def html_button_to(html = nil, options = nil, html_options = nil)
    button_to(options, html_options) do
      html
    end
  end

  def current_user_display_name
    return current_user.discord_username if current_user.character.nil?

    "#{current_user.character.name} (#{current_user.discord_username})"
  end

  def translate_character_weapon_name(weapon_name)
    I18n.t("character.weapon.#{weapon_name}")
  end
end
