class Group < ActiveRecord::Base

  validates_presence_of :name, :user_id

  belongs_to :user
  has_many :admins, :as => :relationable,  :class_name => "Admin"
  has_many :members, :as => :relationable,  :class_name => "Member"

  # admins
  def add_admin(user_id)
    admins.create(association_id: user_id)
  end

  def get_admins
    User.where(id: admins.map(&:association_id))
  end

  def remove_admin(user_id)
    admins.where(association_id: user_id).first.destroy
  end

  # members
  def add_member(user_id)
    members.create(association_id: user_id)
  end

  def get_members
    User.where(id: members.map(&:association_id))
  end

  def remove_member(user_id)
    members.where(association_id: user_id).first.destroy
  end
end
