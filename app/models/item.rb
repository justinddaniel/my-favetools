class Item < ActiveRecord::Base
  belongs_to :folder

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  # Class method - find tools that belongs to user_id
  def self.find_by_user(user_id)
    Item.joins(:folder).where(folders: {user_id: user_id}).order('id DESC')
  end

  # Class method - find tools that meets the privacy setting and belongs to user_id
  def self.find_by_user_privacy(user_id, privacy)
    Item.joins(:folder).where(folders: {user_id: user_id, privacy: privacy}).order('id DESC')
  end

  # Class method - find tools that meets the privacy setting, excluding the users with user_id
  def self.find_by_privacy_not_user(privacy, user_id)
    Item.joins(:folder).where(folders: {privacy: privacy}).where.not(folders: {user_id: user_id}).order('id DESC')
  end
end