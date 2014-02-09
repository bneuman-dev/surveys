helpers do
  def calculate_percentages(q_stats)
    total_responses = q_stats.reduce(0) do |count,q|
      count += q[:count]
    end

    q_stats.each do |stat|
      stat[:percent] = calculate_percent(stat, total_responses)
    end

    q_stats
  end

  def calculate_percent(q_stat, total_resp)
    ((q_stat[:count].to_f / total_resp) * 100).to_i
  end

  def stats_with_percentages(question)
    stats = question_response_stats(question)
    calculate_percentages(stats)
  end
end