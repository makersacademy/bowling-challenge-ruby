with open('input.txt','r') as f:
    print(sum([int(line.strip()) for line in f]))

def read_score_of_roll(roll_num, frame_num):
    score = int(
        input(f"Enter score for Frame-{frame_num}, Roll-{roll_num}:  "))
    # if score > 10:
    #     raise "Invalid score"
    return score


def record_scores(list_of_scores, *values):
    list_of_scores.append((*values,))


def record_10_frames():
    frame = 1
    scores = []
    while frame < 11:
        score1 = read_score_of_roll(1, frame)

        if frame < 10:
            if score1 < 10:
                score2 = read_score_of_roll(2, frame)
                record_scores(scores, score1, score2)
            elif score1 == 10:
                record_scores(scores, 10)
            
        if frame == 10:
            score2 = read_score_of_roll(2, frame)
            if score1 + score2 < 10:
                record_scores(scores, score1, score2)
                break
            score3 = read_score_of_roll(3, frame)
            record_scores(scores, score1, score2, score3)
            
        frame += 1

    return scores

def calculate_score(list_of_scores):
    total = 0
    i = 0
    # Iterate until 9th frame
    while i < 9:
        print(total)
        # Spare bonus
        if len(list_of_scores[i]) == 2 and sum(list_of_scores[i]) == 10:
            spare_bonus = list_of_scores[i+1][0]
            total += spare_bonus
        # Strike bonus
        elif len(list_of_scores[i]) == 1:
            strike_bonus = sum(list_of_scores[i+1][0:2])
            total += strike_bonus
        # Frame score
        total += sum(list_of_scores[i])
        i += 1
    total += sum(list_of_scores[-1])
    
    return total


game = record_10_frames()
print(game)
print(calculate_score(game))


