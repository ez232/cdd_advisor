class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    def current_project
      Project.find(session[:project_id])
    rescue
      nil
    end
end
