class Rest::PowersController < Rest::BaseController
  def available
    character = Character.where(id: params[:character_id]).first
    if character
      result = { success: true, powers: character.powers.available(character.level) }
    else
      result = { success: false, error: "No character found!" }
    end
    render json: result
  end
end
