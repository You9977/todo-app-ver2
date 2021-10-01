class Task < ApplicationRecord
  validates :title, presence: true
  validates :detail, length: { maximum: 200 }
  validate  :deadline_should_be_future
  
  def deadline_should_be_future
    if deadline.present? && deadline < Date.yesterday
      errors.add(:deadline, "期限は今日より前の日付は入力できません。")
    end
  end
end
