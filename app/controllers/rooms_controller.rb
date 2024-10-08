class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]# ログインしているユーザーのみがアクセスできるようにする

  def search
    @rooms = Room.all
    if params[:area].present?
      @rooms = @rooms.where("address LIKE ?", "%#{params[:area]}%")
    end
  
    if params[:keyword].present?
      @rooms = @rooms.where("name LIKE ? OR description LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end
  end
  
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params) # ログインしているユーザーに関連付ける
    if @room.save
      redirect_to rooms_path, notice: '施設が正常に登録されました。'
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :price, :address, :image)
  end
end

