class ActionChit < ActiveRecord::Base
  belongs_to :player
  scope :move_chits, -> {where(chit_type: 'move')}
  scope :combat, -> {where(chit_type: 'cobmat')}
end
