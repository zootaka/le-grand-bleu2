class LogBooksController < ApplicationController
  before_action :move_to_map, except: [:show]
  before_action :authenticate_user!
  before_action :set_log_book, only: [:show, :edit, :update, :destroy]

  def index
    @log_books = LogBook.all
  end

  def new
    @log_book = LogBook.new
  end

  def create
    @log_book = LogBook.new(log_book_params)
    if @log_book.save
      redirect_to user_log_book_path(current_user.id, @log_book.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @log_book.update(log_book_params)
      redirect_to user_log_book_path(params[:id])
    else
      render :new
    end
  end

  def destroy
    if current_user.id == @log_book.user_id
      @log_book.destroy
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  private

  def log_book_params
    params.require(:log_book).permit(:place, :temperature, :water_temperature, :transparency, :en_time, :ex_time, :deep_avg,
                                     :deep_max, :weight, :wear, :free_space, :member).merge(user_id: current_user.id)
  end

  def move_to_map
    redirect_to maps_path unless user_signed_in?
  end

  def set_log_book
    @log_book = LogBook.find(params[:id])
  end
end
