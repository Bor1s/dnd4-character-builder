class Rest::CharactersController < Rest::BaseController

  def index
    characters = Character.all
    unless characters.empty?
      result = { success: true, characters: characters }
    else
      result = { success: false, error: "No characters found!" }
    end
    render json: result
  end

  def show
    character = Character.where(id: params[:id]).first
    if character
      result = { success: true, character: character }
    else
      result = { success: false, error: "No character with #{params[:id]} found!" }
    end
    render json: result
  end

  def create
    begin
      character = Character.create!
      result = { success: true, character: character }
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
        RuleProcessor.new(character).revert(params[:stage])
        RuleProcessor.new(character).process(params[:stage])
        character.save!
        result = { success: true, character: character }
      rescue => e
        result = { success: false, error: e.message }
      end
    else
      result = { success: false, error: "No character with ID=#{params[:id]} found!" }
    end

    render json: result
  end
end
