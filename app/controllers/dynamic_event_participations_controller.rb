class DynamicEventParticipationsController < BaseController
  def new
    @dynamic_event_participation = DynamicEventParticipation.new
  end

  def index
    @dynamic_event_participations = current_character.dynamic_event_participations
  end

  def create
    @dynamic_event_participation = DynamicEventParticipation.new(dynamic_event_participation_create_params)

    if @dynamic_event_participation.save
      redirect_to dynamic_event_participations_path
    else
      render :new
    end
  end

  private

  def dynamic_event_participation_create_params
    params.require(:dynamic_event_participation).permit(:event_name, :mode, :discord_image_url).merge(
      character: current_character
    )
  end
end

# https://media.discordapp.net/attachments/1318221295481262112/1319325085844111360/image.png?ex=678530bc&is=6783df3c&hm=029c1d9fe6e95bf0e1b0bd045972142493b7e38c1fbc6ba4a7dda46d58e32cbd&=&format=webp&quality=lossless&width=1174&height=661
