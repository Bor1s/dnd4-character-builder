class Rest::ClassesController < Rest::BaseController

  def index
    klasses = Templates::Klass.all   
    unless klasses.empty?
      result = { success: true, classes: klasses}
    else
      result = { success: false, error: "No classes found!" }
    end
    render json: result
  end
end
