class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
    before_action :set_team, only: [:index,:edit, :new, :show]

    def set_team
      team_id = params[:team_id] || params[:message][:team_id] rescue nil
      @team = Team.find(team_id) rescue  @team = Team.first
    end
end
