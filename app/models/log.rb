class Log < ActiveRecord::Base

  belongs_to :user

  validates :date, presence: true
  validates :oponent, presence: true
  validates :my_score, numericality: { only_integer: true }
  validates :their_score, numericality: { only_integer: true }
  validates :my_score, numericality: { less_than_or_equal_to: 21 }
  validates :their_score, numericality: { less_than_or_equal_to: 21 }
  validates :my_score, numericality: { greater_than_or_equal_to: 1 }
  validates :their_score, numericality: { greater_than_or_equal_to: 1 }

  after_validation :difference


  def get_email(user_id)
    return User.where(id: user_id).first
  end

  private

  def difference
    diff = [self.my_score, self.their_score]
    max = diff.max
    min = diff.min

    result =  max - min

    #flash[:notice] = errors.add(message: "Difference in result must to be greater or equal than 2") if result < 2
    self.errors.add(:created_on, "Difference in result must to be greater or equal than 2") if result < 2
  end

end
