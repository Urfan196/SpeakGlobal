class Convo < ApplicationRecord
  belongs_to :lesson
  has_many :users, through: :lesson
end
