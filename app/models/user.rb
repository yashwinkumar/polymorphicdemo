class User < ActiveRecord::Base

  validates_presence_of :name

  has_many :groups
  has_many :friends, :as => :relationable,  :class_name => "Friend"
  has_many :follows, :as => :relationable,  :class_name => "Follow"
  has_many :followees, :as => :relationable,  :class_name => "Followee"

  # friend
  def add_friend(user_id)
    friends.create(association_id: user_id)
  end

  def get_friends
    User.where(id: friends.map(&:association_id))
  end

  def unfriend(user_id)
    friends.where(association_id: user_id).first.destroy
  end

  # follows
  def add_following(user_id)
    follows.create(association_id: user_id)
  end

  def get_followings
    User.where(id: follows.map(&:association_id))
  end

  def unfollow(user_id)
    follows.where(association_id: user_id).first.destroy
  end

  # followees
  def add_followee(user_id)
    followees.create(association_id: user_id)
  end

  def get_followees
    User.where(id: followees.map(&:association_id))
  end

  def remove_followee(user_id)
    followees.where(association_id: user_id).first.destroy
  end

end
