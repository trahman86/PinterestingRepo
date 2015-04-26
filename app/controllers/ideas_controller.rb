class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :check_user, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html

  def index
    @ideas = Idea.all
    respond_with(@ideas)
  end

  def show
    respond_with(@idea)
  end

  def new
    @idea = current_user.ideas.build
    respond_with(@idea)
  end

  def edit
  end

  def create
    @idea = current_user.ideas.build(idea_params)
    @idea.save
    respond_with(@idea)
  end

  def update
    @idea.update(idea_params)
    respond_with(@idea)
  end

  def destroy
    @idea.destroy
    respond_with(@idea)
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def check_user
      redirect_to ideas_path, notice: "Please log in to work with ideas." if @current_user.nil?
    end

    def correct_user
      @idea = current_user.ideas.find_by(id: params[:id])
      redirect_to ideas_path, notice: "Not authorized to edit this idea." if @idea.nil?
    end

    def idea_params
      params.require(:idea).permit(:description, :string)
    end
end
