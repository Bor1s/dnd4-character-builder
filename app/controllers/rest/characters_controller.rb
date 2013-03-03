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

  def update
    character = Character.where(id: params[:id]).first
    if character
      character.attributes = params[:character]
      begin
        RuleProcessor.new(character).process
        character.save!
        result = { success: true, character: character }
      rescue => e
        result = { success: false, error: e.message }
      end
    else
      result = { success: false, error: "No character with id = #{params[:id]} found!" }
    end

    render json: result
  end
end
