helpers do

  def question_response_stats(question)
    possible_answers = question.possible_answers.order('id')
    possible_answers.collect do |answer|
      {answer: answer.text,
       count: responses_count(answer)}
    end
  end

  def responses_count(answer)
    Response.where(possible_answer: answer).count
  end
end
