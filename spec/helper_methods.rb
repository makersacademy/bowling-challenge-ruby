
def fill_default_score score_object, i=0, max_frame=10
  # accepts a Score class object, and an index. fills the Score object with the indexed scores
  scores = [[[1, 4], [4, 5], [6, 4], [5, 5], [10], [0, 1], [7, 3], [6, 4], [10], [2, 8, 6]],
            [[1, 4], [4, 5], [6, 4], [5, 5], [10], [0, 1], [7, 3], [6, 4], [10], [10, 3, 7]]
  ]

  fill_score(score_object, scores[i])
end

def fill_score score_object, scores
  scores.each_with_index do |frame, n|
    frame.each{ |roll| score_object.add_score(n + 1, roll) }
  end
end