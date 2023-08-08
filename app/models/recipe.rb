class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', optional: true

  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparation_time, numericality: true
  validates :cooking_time, numericality: true
  validates :public, inclusion: { in: [true, false] }

  def final_price
    foods.sum(:price)
  end
end
