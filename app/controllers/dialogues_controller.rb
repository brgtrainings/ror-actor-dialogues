class DialoguesController < ApplicationController
  def index
    @dialogues = Dialogue.all
  end

  def show
    @dialogue = Dialogue.find(params[:id])
  end

  def new
    @dialogue = Dialogue.new
  end

  def create
    @dialogue = Dialogue.new(dialogue_params)
    if @dialogue.save
      flash[:notice] = "Dialogue created successfully."
      redirect_to @dialogue
    else
      render 'new'
    end
  end

  private

  def dialogue_params
    params.require(:dialogue).permit(:line, :movie, :nonveg)
  end
end
