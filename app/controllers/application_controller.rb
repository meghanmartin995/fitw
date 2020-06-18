class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_user!

  def default_url_options
   { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def is_admin!
    unless current_user&.admin
      redirect_to root_path
    end
  end
end
