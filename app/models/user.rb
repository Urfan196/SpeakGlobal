class User < ApplicationRecord
    has_secure_password
    
    has_many :fluencies
    has_many :languages, through: :fluencies
    has_many :experiences, through: :fluencies

    has_many :student_lesson, foreign_key: :teacher_id, class_name: "Lesson"
    has_many :students, through: :student_lesson, source: :student

    has_many :teacher_lesson, foreign_key: :student_id, class_name: "Lesson"
    has_many :teachers, through: :teacher_lesson, source: :teacher


    
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { in: 8..20 }

    


   
end
