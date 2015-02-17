class TraversableClearing < ActiveRecord::Base
  belongs_to :clearing
  belongs_to :traversable, class_name: "Clearing"
end
