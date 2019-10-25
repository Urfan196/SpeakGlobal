Language.destroy_all
Experience.destroy_all
User.destroy_all
Fluency.destroy_all

languages = ["Amharic",	
    "Arabic",	
    "Basque",	
    "Bengali",	
    "English (UK)",	
    "Portuguese",
    "Bulgarian",	
    "Catalan",
    "Cherokee",	
    "Croatian",
    "Czech",
    "Danish",
    "Dutch",
    "English (US)",
    "Estonian",
    "Filipino",
    "Finnish",
    "French",
    "German",
    "Greek",
    "Gujarati",
    "Hebrew",
    "Hindi",	
    "Hungarian",	
    "Icelandic",	
    "Indonesian",	
    "Italian",	
    "Japanese",	
    "Kannada",	
    "Korean",	
    "Latvian",
    "Lithuanian",	
    "Malay",	
    "Malayalam",	
    "Marathi",	
    "Norwegian",	
    "Polish",	
    "Portuguese (Portugal)",
    "Romanian",
    "Russian",	
    "Serbian",
    "Chinese (PRC)",
    "Slovak",	
    "Slovenian",	
    "Spanish",	
    "Swahili",
    "Swedish",	
    "Tamil",	
    "Telugu",
    "Thai",	
    "Chinese (Taiwan)",	
    "Turkish",	
    "Urdu",
    "Ukrainian",
    "Vietnamese",	
    "Welsh"
]

# english = Language.create(name: "English")
# spanish = Language.create(name: "Spanish")
# chinese = Language.create(name: "Chinese")

languages.each do |language|
    Language.create(name: language)
end

level_1 = Experience.create(level: "Beginner")
level_2 = Experience.create(level: "Intermediate")
level_3 = Experience.create(level: "Advanced")
level_4 = Experience.create(level: "Proficient")

user_1 = User.create(first_name: "John", last_name: "Doe", birthday: "21/01/1990", password_digest: "1234@T123t", email: "johndoe@fakeemail.com" )
user_2 = User.create(first_name: "Jane", last_name: "Doe", birthday: "13/05/1989", password_digest: "hello456ft", email: "janedoe@fakeemail.com" )
user_3 = User.create(first_name: "Carl", last_name: "Allen", birthday: "30/11/1947", password_digest: "idc147ll", email: "carlallen@fakeemail.com" )

10.times do
    Fluency.create(experience_id: rand(1..4), user_id: rand(1..3), language_id: rand(1..3))
end


