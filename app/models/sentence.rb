class Sentence < ApplicationRecord
  belongs_to :user
  belongs_to :story
  validates :text, :presence => true
end
