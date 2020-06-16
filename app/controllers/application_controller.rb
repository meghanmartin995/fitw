class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_user!

  def is_admin!
    unless current_user&.admin
      redirect_to root_path
    end
  end
end
