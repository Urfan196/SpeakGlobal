class User < ApplicationRecord
    has_secure_password
    
    has_many :fluencies
    has_many :languages, through: :fluencies
    has_many :experiences, through: :fluencies

    has_many :student_lesson, foreign_key: :teacher_id, class_name: "Lesson"
    has_many :students, through: :student_lesson, source: :student

    has_many :teacher_lesson, foreign_key: :student_id, class_name: "Lesson"
    has_many :teachers, through: :teacher_lesson, source: :teacher


    
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    
    PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
    /x

    validates :password, 
    presence: true, 
    length: { in: 8..20 }, 
    format: { with: PASSWORD_FORMAT }, 
    confirmation: true, 
    on: :create 

    validates :password, 
    allow_nil: true, 
    length: { in: 8..20 }, 
    format: { with: PASSWORD_FORMAT }, 
    confirmation: true, 
    on: :update
    
   
  def unlearned_languages
    @user_fluencies = Fluency.all.select do |fluency|
      self.id == fluency.user_id
    end
    @user_lang_ids = @user_fluencies.map{|fluency| fluency.language_id}.uniq

    Language.all.select do |language|
      !(@user_lang_ids.include?(language.id))
    end
  end

  def student_lessons
    Lesson.find_by(student_id: self.id)
  end

  def teacher_lessons
    Lesson.find_by(teacher_id: self.id)
  end

  # def self.search(search_params)
  #   if search_params
      
  #     language = Language.find_by(name: search_params)
  #     fluency = Fluency.find_by(language_id: language.id)
  #     if fluency
  #       fluency.each do |f|
  #         user_id = f.user_id
  #         user = User.find_by(id: user_id)
  #         self.where(name: user.name)
  #       end
  #     else
  #       all_users = User.all
  #     end
  #   else
  #     all_users = User.all
  #   end
  # end
    
   
end
