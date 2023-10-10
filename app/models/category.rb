# frozen_string_literal: true

class Category < ApplicationRecord
  validates :icon, presence: true
  validates :name, presence: true

  belongs_to :user
  has_many :operations, dependent: :destroy
end
