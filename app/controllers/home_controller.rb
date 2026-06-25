class HomeController < ApplicationController
  TREATMENT_SLUGS=%w[
    early-treatment
    wedding-braces
    smile-in-5-months
    facial-surgery
  ].freeze

  BRACES_SLUGS=%w[
    clear-glass-braces
    hidden-lingual-braces
    invisalign
  ].freeze

  def index
  end

  def results
    @results=(1..9).to_a
  end

  def promise
  end

  def treatments
  end

  def treatment
    @slug=params[:slug]
    raise ApplicationController::RoutingError, "Not Found" unless TREATMENT_SLUGS.include?(@slug)

    render "home/treatment/#{@slug.tr('-','_')}" 
  end
  
  def braces
    @slug=params[:slug]
    raise ApplicationController::RoutingError, "Not Found" unless BRACES_SLUGS.include?(@slug)

    render "home/braces/#{@slug.tr('-','_')}" 
  end

end
