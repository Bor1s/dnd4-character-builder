class Rest::ClassesController < Rest::BaseController

  def index
    classes = CharacterClass.all   
    render json: classes
  end
end
