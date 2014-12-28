class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  rolify

  # Extra fields for leader board stuffs.
  attr_writer :overall_score, :first, :second, :third

  has_many :game_results, dependent: :destroy
  has_many :questions, dependent: :destroy

  def identifier
    full_name.blank? ? email : full_name
  end

  def full_name
    [first_name, last_name].reject {|n| n.blank?}.join ' '
  end

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.where(email: data["email"]).first
      # TODO: Once all current users have last_name, we can pull this out.
      if !user.last_name?
        user.last_name = data["last_name"].try(:first)
        user.save!
      end
      user
    else
      User.create!(
        email: data["email"],
        first_name: data["first_name"],
        last_name: data["last_name"].try(:first),
        password: Devise.friendly_token[0,20]
      )
    end
      #stubbing methods from the class under test===bad
  end

  def percentage_correct_overall
    ((questions.correct.count.to_f / questions.count.to_f)*100)
  end

end
