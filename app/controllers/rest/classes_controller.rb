class Rest::ClassesController < Rest::BaseController

  def index
    klasses = Templates::Klass.all   
    render json: klasses
  end
end
