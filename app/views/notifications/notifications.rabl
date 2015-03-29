collection @notifications

attributes :action, :turn
node(:player){|n| n.player.name}
