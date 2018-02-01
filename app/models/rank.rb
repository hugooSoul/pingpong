class Rank < ActiveRecord::Base

  belongs_to :user

  WIN = 20
  DRAW = 10
  LOOSE = 1


  def self.set_values(user1, user2, score1, score2)
    score_u1 = 0
    score_u2 = 0
    if score1 > score2
      score_u1 += WIN
      score_u2 += LOOSE
    elsif score2 > score1
      score_u2 += WIN
      score_u1 += LOOSE
    elsif score1 == score2
      score_u1 += DRAW
      score_u2 += DRAW
    end

    if Rank.where(user_id: user1).exists?
       r = Rank.where(user_id: user1).first
      score1 = r.score += score1
      r1 = Rank.where(user_id: user1).update_all(score: score1)
    else
      r1 = Rank.new({
        user_id: user1,
        score: score_u1
        })
        r1.save
    end

    if Rank.where(user_id: user2).exists?
      r2 = Rank.where(user_id: user2).first
      score2 = r2.score += score2
      r2 = Rank.where(user_id: user2).update_all(score: score2)
    else
      r2 = Rank.new({
        user_id: user1,
        score: score_u2
        })
        r2.save
    end

  end

end
