class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :name, presence: true
  validates :preparation_time, numericality: true
  validates :cooking_time, numericality: true
  validates :public, inclusion: { in: [true, false] }
end
