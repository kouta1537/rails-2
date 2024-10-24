class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :check_in_date, :check_out_date, presence: true
  validate :check_in_must_be_today_or_later
  validate :check_out_must_be_after_check_in
  validates :guest_count, numericality: { greater_than: 0 }

  def status
    if check_in_date.present? && check_out_date.present?
      '予約確定' 
    else
      '未確定' 
    end
  end
  
  private


  def check_in_must_be_today_or_later
    if check_in.present? && check_in < Date.today
      errors.add(:check_in_date, "は本日以降の日付にしてください")
    end
  end


  def check_out_must_be_after_check_in
    if check_in.present? && check_out.present? && check_out <= check_in
      errors.add(:check_out_date, "はチェックイン日より後の日付にしてください")
    end
  end

end
