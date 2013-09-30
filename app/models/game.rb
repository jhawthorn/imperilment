class Game < ActiveRecord::Base
  has_many :answers
  has_many :users, through: :answers
  has_many :game_results

  scope :locked, -> { where(locked: true) }

  before_update do
    calculate_result! if self.locked_changed? && self.locked
  end

  self.per_page = 10

  def score(user)
    Question.joins(:answer => :game).where(user_id: user.id, 'games.id' => self.id).to_a.sum do |question|
      if question.answer.amount.nil? && !self.locked?
        0
      else
        question.correct_question.blank? ? 0 : question.value
      end
    end
  end

  def started_on
    answers.order(:start_date).pluck(:start_date).first
  end

  def date_range
    (started_on..ended_at)
  end

  def calculate_result!
    GameResult.where(game_id: self.id).destroy_all
    position = 1
    grouped_and_sorted_by_score.each do |total, users|
      users.each do |user|
        GameResult.create! user_id: user.id, game_id: self.id, total: total, position: position
      end
      position += users.size
    end
  end

  def grouped_and_sorted_by_score
    users.uniq.sort_by do |user|
      -self.score(user)
    end.group_by do |user|
      self.score(user)
    end
  end
end
