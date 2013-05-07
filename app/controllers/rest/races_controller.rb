class Rest::RacesController < Rest::BaseController

  def index
    races = Templates::Race.all
    render json: races
  end

  def show
    render json: Templates::Race.find(params[:id])
  end
end
