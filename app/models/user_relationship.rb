class UserRelationship < ActiveRecord::Base
  validates_presence_of :relationable_type, :relationable_id, :type, :association_id
  validates_uniqueness_of :type, :scope => [:relationable_type, :relationable_id, :association_id]
  before_validation Proc.new {|p| p.relationable_id != p.association_id}

  belongs_to :relationable, polymorphic: true
end

