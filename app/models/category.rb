# Generate the file.

class Category < ApplicationRecord
  validates :icon, presence: true
  validates :name, presence: true

  belongs_to :user
  has_many :operations, dependent: :destroy

  def total_amount
    operations.sum(:amount)
  end
end
