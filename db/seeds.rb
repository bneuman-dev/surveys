require 'faker'

#---------------------CREATE DBC SURVEY-------------------------#

user = User.create(name: "Mike Busch", email: "mikelikesbikes@email.com", password: 'password')

QUESTIONS = [
  {question: "How many times a week do you find time to wash yourself?",
   answers: %w(None Once Twice) + ["Four times, if I'm lucky"]},
  
  {question: "How would you describe your average stress level, on a scale of 1-100?",
   answers: %w(90 95 100 125 1000)},

  {question: "How many times a day, on average, do you eat at Subway?",
    answers: %w(1 2 3 5)},

  {question: "How long has it been since you went grocery shopping?",
   answers: ["A week", "A month", "Two months", "A year"]},

   {question: "How many times will you re-wear clothing because you don't have time to do laundry?",
    answers: ["Twice", "Three times", "infinite times, no time for laundry", "depends, what article of clothing are we talking about?"]}
]

survey = user.surveys.create(title: "DBC Student Survey",
                       description: "Our goal is to make sure you don't have the time to carry out basic human functions. How good of a job are we doing? Help us find out.",
                       pic_url: "http://www.cute-wallpaper.com/backgrounds/animals/squirrel_with_big_cheeks.jpg")

QUESTIONS.each do |q|
  question = survey.questions.create(question: q[:question])
  q[:answers].each do |a|
    question.possible_answers.create(text: a)
  end
end


#------------------------CREATE 20 USERS AND RANDOMLY-GENERATED RESPONSES TO SURVEY-------------#
20.times do
  user = User.create(name: Faker::Name.name, 
                    email: Faker::Internet.email, 
                    password: 'password')
  survey.questions.each do |q|
    poss_answers = q.possible_answers
    choice = rand(0..(q.possible_answers.count - 1))
    answer = poss_answers[choice]
    Response.create(user: user, possible_answer: answer)
  end
  user.surveys_taken << survey
end



#----------------------CREATE RANDOM SURVEYS, JUST BECAUSE----------------#
User.all.each do |user|

  (rand(5)).times do
    survey = user.surveys.create(title: Faker::Commerce.product_name, description: Faker::Company.catch_phrase, pic_url: Faker::Company.catch_phrase)
    (rand(10)).times do
      question = survey.questions.create(question: Faker::Company.bs)
      (rand(6) + 2).times do |n|
        question.possible_answers.create(text: Faker::Company.catch_phrase)
      end
    end
  end
end


#--------------------ANSWERS TO THOSE SURVEYS--------------------#
surveys = Survey.where("id > 1")
surveys.each do |s|
  5.times do
    (user = User.find(rand(1..20))) until user.surveys_taken.where(id: s.id).empty?

    s.questions.each do |q|
      poss_answers = q.possible_answers
      choice = rand(0..(q.possible_answers.count - 1))
      answer = poss_answers[choice]
      Response.create(user: user, possible_answer: answer)
    end

    user.surveys_taken << s
  end
end