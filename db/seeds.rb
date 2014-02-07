# Create two new users
User.create(name: 'charlie', email: 'charlie@charlie.com', password: '123456')

User.create(name: 'laura', email: 'laura@laura.com', password: '123456')

# Create dummy surveys for Laura and Charlie.
5.times do

  Survey.create(title: 'laura_title', description: 'laura_description', pic_url: 'laura_pictureurl', creator_id:2)

end

15.times do

  Survey.create(title: 'charlie_title', description: 'charlie_description', pic_url: 'charlie_pictureurl', creator_id:1)

end

# 5 questions on Charlie survey, id 1.
5.times do

  Question.create(question: 'charlie_question', survey_id: 1)

end

# 10 questions on Laura survey, id 6.
10.times do

  Question.create(question: 'laura_question', survey_id: 6)

end

# 5 answers on Charlie survey 1, question 1.
5.times do

  PossibleAnswer.create(text: 'charlie_answer', question_id: 1)

end

# 10 answers on Laura survey 6, question 6.
10.times do

  PossibleAnswer.create(text: 'laura_answer', question_id: 6)

end

# Create User and answer a question on a survey.
User.create(name: 'junting', email: 'junting@junting.com', password: '123456')
# Pick possible answer id 10 on laura survey 6, quesiton 6.
Response.create(user_id: 3, possible_answer_id: 10)
