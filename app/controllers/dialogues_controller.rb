class DialoguesController < ApplicationController
  before_action :authenticate_user!

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
    @dialogue.user = current_user
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
    @dialogue.user = current_user

    if @dialogue.save
      flash[:notice] = 'Dialogue was updated successfully.'
      redirect_to @dialogue
    else
      flash[:alert] = 'Something went wrong.'
      render 'edit'
    end
  end

  def destroy
    @dialogue = Dialogue.find(params[:id])
    if @dialogue.destroy
      flash[:notice] = 'Dialogue was deleted successfully.'
    else
      flash[:alert] = 'Something went wrong.'
    end

    redirect_to dialogues_path
  end

  private

  def dialogue_params
    params.require(:dialogue).permit(:line, :movie, :nonveg)
  end
end
