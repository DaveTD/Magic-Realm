class Notification < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  scope :not_private, -> {where(private_notification: false)}
  scope :is_private, -> {where(private_notification: true)}
  scope :not_shown, -> {where(shown: false)}

  def private?
    private_notification
  end
end
