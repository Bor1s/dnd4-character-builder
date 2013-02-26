class Rest::CharactersController < Rest::BaseController

  def create
    begin
      character = Character.create!
      result = { success: true, id: character.id }
    rescue => e
      result = { success: false, error: "Cannot create character!" }
    end
    
    render json: result
  end
end
