class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:new, :create, :confirm, :complete]

  def new
    @reservation = Reservation.new
  end

  def index
    @reservations = current_user.reservations.includes(:room) # ユーザーの予約を取得
  end

  def create
    @reservation = @room.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to confirm_room_reservation_path(@room, @reservation), notice: '予約が確定されました。'
    else
      Rails.logger.error(@reservation.errors.full_messages)
      render :new
    end
  end

  def complete
    @reservation = @room.reservations.find(params[:id])
  
    if @reservation.update(status: 'confirmed') # 確定状態に更新
      redirect_to reservations_path, notice: '予約が確定されました。' # 予約済み一覧画面にリダイレクト
    else
      redirect_to confirm_room_reservation_path(@room, @reservation), alert: '予約の確定に失敗しました。'
    end
  end

  def confirm
    @reservation = @room.reservations.find_by(id: params[:id])
    
    if @reservation.present?
      @total_price = (@reservation.check_out_date - @reservation.check_in_date).to_i * @reservation.room.price * @reservation.guest_count
    else
      redirect_to rooms_path, alert: '予約が見つかりませんでした。'
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:check_in_date, :check_out_date, :guest_count)
  end
end
