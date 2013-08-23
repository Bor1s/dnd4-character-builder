class Rest::CharactersController < Rest::BaseController

  before_action :find_character, only: [:update, :show]

  def index
    characters = Character.all
    render json: characters
  end

  def show
    render json: @character
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

      @character.attributes = character_attrs
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
    render nothing: true, status: 204 unless @character
  end

  def character_attrs
    params.require(:character).permit!
  end
end
