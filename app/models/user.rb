class User < ApplicationRecord
  has_many :sentences
  has_many :stories, through: :sentences
  validates :name, :presence => true
end
