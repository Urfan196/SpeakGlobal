Language.destroy_all
Experience.destroy_all
User.destroy_all
Fluency.destroy_all

english = Language.create(name: "English")
spanish = Language.create(name: "Spanish")
chinese = Language.create(name: "Chinese")

level_1 = Experience.create(level: "Beginner")
level_2 = Experience.create(level: "Intermediate")
level_3 = Experience.create(level: "Advanced")
level_4 = Experience.create(level: "Proficient")

user_1 = User.create(first_name: "John", last_name: "Doe", birthday: "21/01/1990", password_digest: '1234@T123t', email: "johndoe@fakeemail.com" )
user_2 = User.create(first_name: "Jane", last_name: "Doe", birthday: "13/05/1989", password_digest: 'hello456ft', email: "janedoe@fakeemail.com" )
user_3 = User.create(first_name: "Carl", last_name: "Allen", birthday: "30/11/1947", password_digest: 'idc147ll', email: "carlallen@fakeemail.com" )

10.times do
    Fluency.create(experience_id: rand(1..4), user_id: rand(1..3), language_id: rand(1..3))
end