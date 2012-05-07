module Spree
  class CommentMailer < ActionMailer::Base
    helper 'spree/base'

    def comment_email(comment, order, resend = false)
      @comment = comment
      @order = order
      subject = (resend ? "[#{t(:resend).upcase}] " : '')
      subject += "#{Spree::Config[:site_name]} Order Updated ##{order.number}"
      mail(:to => order.email,
           :subject => subject)
    end
  end
end