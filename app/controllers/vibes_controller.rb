class VibesController < ApplicationController
  def show
    @vibe = Vibe.find(params[:id])
  end
end
