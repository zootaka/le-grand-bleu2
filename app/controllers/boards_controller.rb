class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_map_place, only: [:index, :create]

  def index
    @comment = Comment.new
    @comments = @map_place.comments.all
  end

  def create
    @comment = @map_place.comments.new(comment_params)
    if @comment.save
      redirect_to map_boards_path(@map_place)
    else
      @comments = @map_place.comments.all
      render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to map_boards_path
    else
      render :index
    end
  end

  private

  def set_map_place
    @map_place = MapPlace.find(params[:map_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id, map_place_id: params[:map_id])
  end
end
