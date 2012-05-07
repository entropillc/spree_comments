class Spree::Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  belongs_to :comment_type
  belongs_to :user
  
  default_scope :order => 'created_at ASC'
  
  after_create :send_notification_email
  
  def send_notification_email
    if self.mailed then
      order = Spree::Order.find(self.commentable_id)
      Spree::CommentMailer.comment_email(self, order).deliver
    end
  end
  
  def mailed?
    self.mailed.eql?(true) ? true : false
  end

end
