class Rest::RacesController < Rest::BaseController

  def index
    races = Race.all
    render json: races
  end

  def show
    render json: Race.find(params[:id])
  end
end
