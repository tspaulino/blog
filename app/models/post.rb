class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged

  belongs_to :author, :class_name => "AdminUser", :foreign_key => "admin_user_id"
  acts_as_taggable

  validates_presence_of [:title, :text, :author]
  validates_uniqueness_of :title

  def publish!
    self.published = true
    self.save
  end

  scope :published, lambda { where(:published => true)}
end
