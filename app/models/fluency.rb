class Fluency < ApplicationRecord
    belongs_to :user
    belongs_to :language
    belongs_to :experience
end
