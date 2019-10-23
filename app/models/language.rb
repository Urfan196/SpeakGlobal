class Language < ApplicationRecord
    has_many :fluencies
    has_many :lessons
    has_many :users, through: :fluencies
end
