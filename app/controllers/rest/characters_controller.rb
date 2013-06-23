class Rest::CharactersController < Rest::BaseController

  before_filter :find_character, only: [:update, :show]

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
    if @character
      result = { success: true, character: @character }
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
    if @character
      RuleProcessor.new(@character).revert(params[:stage])

      @character.attributes = params[:character]
      begin
        RuleProcessor.new(@character).process(params[:stage])
        @character.save!
        result = { success: true, character: @character }
      rescue => e
        result = { success: false, error: e.message }
      end
    else
      result = { success: false, error: "No character with ID=#{params[:id]} found!" }
    end

    render json: result
  end

  private

  def find_character
    @character = Character.where(id: params[:id]).first
  end
end
