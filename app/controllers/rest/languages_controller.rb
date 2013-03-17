class Rest::LanguagesController < Rest::BaseController

  def index
    langs = Templates::Language.all
    unless langs.empty?
      result = { success: true, languages: langs }
    else
      result = { success: false, error: "No languages found!" }
    end
    render json: result
  end

  #TODO determine acceptable languages by race, feats etc.
end
