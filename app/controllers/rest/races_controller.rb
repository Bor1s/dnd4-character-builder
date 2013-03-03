class Rest::RacesController < Rest::BaseController

  def index
    races = Templates::Race.all.to_a
    unless races.empty?
      result = { success: true, races: races }
    else
      result = { success: false, error: "No races found!" }
    end
    render json: result
  end
end
