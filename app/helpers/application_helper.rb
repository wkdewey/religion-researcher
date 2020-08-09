module ApplicationHelper

  def current_researcher
    @current_researcher ||= Researcher.find_by(id: session[:researcher_id])
  end

  def logged_in?
    !!session[:researcher_id]
  end
end
