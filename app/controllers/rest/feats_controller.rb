class Rest::FeatsController < Rest::BaseController
  def index
    feats = Templates::Feat.all   
    unless feats.empty?
      result = { success: true, feats: feats}
    else
      result = { success: false, error: "No feats found!" }
    end
    render json: result
  end

  def available
    character = Character.where(id: params[:character_id]).first
    if character
      result = { success: true, feats: character.feats.available }
    else
      result = { success: false, error: "No character found!" }
    end
    render json: result
  end
end
