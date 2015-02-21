class ActionQueue < ActiveRecord::Base
  belongs_to :player
  belongs_to :action_chit
  belongs_to :clearing
  belongs_to :clearing_end, class_name: "Clearing"
end
