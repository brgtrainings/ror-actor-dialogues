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

  def edit
    @dialogue = Dialogue.find(params[:id])
  end

  def update
    @dialogue = Dialogue.find(params[:id])
    @dialogue.update(dialogue_params)

    if @dialogue.save
      flash[:notice] = 'Dialogue was updated successfully.'
      redirect_to @dialogue
    else
      flash[:alert] = 'Something went wrong.'
      render 'edit'
    end
  end

  private

  def dialogue_params
    params.require(:dialogue).permit(:line, :movie, :nonveg)
  end
end
