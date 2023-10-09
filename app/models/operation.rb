class Operation < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :category
  belongs_to :user
end
