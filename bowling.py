def read_score_of_roll(roll_num, frame_num):
    score = int(
        input(f"Enter score for Frame-{frame_num}, Roll-{roll_num}:  "))
    # if score > 10:
    #     raise "Invalid score"
    return score


def record_scores(list_of_scores, *values):
    list_of_scores.append((*values,))


def record_10_frames():
    frame = 10
    scores = []
    while frame < 11:
        score1 = read_score_of_roll(1, frame)
        if frame < 10:
            if score1 == 10:
                record_scores(scores, 10)
            elif score1 < 10:
                score2 = read_score_of_roll(2, frame)
                record_scores(scores, score1, score2)

        if frame == 10:
            score2 = read_score_of_roll(2, frame)
            if score1 + score2 < 10:
                record_scores(scores, score1, score2)
                break
            score3 = read_score_of_roll(3, frame)
            record_scores(scores, score1, score2, score3)
            
        frame += 1
    return scores


print(record_10_frames())
