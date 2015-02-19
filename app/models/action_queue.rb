class ActionQueue < ActiveRecord::Base
  belongs_to :player
  belongs_to :clearing
end
