class Story < ApplicationRecord
  has_many :sentences
  has_many :users, through: :sentences
  validates :title, :presence => true
end
