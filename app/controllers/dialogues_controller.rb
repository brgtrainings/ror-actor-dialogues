class DialoguesController < ApplicationController
  def index
    @dialgues = Dialogue.all
  end

  def show
    @dialogue = Dialogue.find(params[:id])
  end
end
