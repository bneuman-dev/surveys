require 'faker'

# create a few users
user = User.create!(name:"user1", email: "email@email.com", password: 'password')

10.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)

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
