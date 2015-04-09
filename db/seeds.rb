  ## Tiles
  Tile.create(name: "cliff", tile_type: 'mountain', enchanted: false)
  Tile.create(name: "evilvalley", tile_type: 'valley', enchanted: false)
  Tile.create(name: "ledges", tile_type: 'mountain', enchanted: false)
  Tile.create(name: "crag", tile_type: 'mountain', enchanted: false)
  Tile.create(name: "highpass", tile_type: 'cave', enchanted: false)
  Tile.create(name: "darkvalley", tile_type: 'valley', enchanted: false)
  Tile.create(name: "borderland", tile_type: 'cave', enchanted: false)
  Tile.create(name: "oakwoods", tile_type: 'woods', enchanted: false)
  Tile.create(name: "deepwoods", tile_type: 'mountain', enchanted: false)
  Tile.create(name: "curstvalley", tile_type: 'valley', enchanted: false)
  Tile.create(name: "cavern", tile_type: 'cave', enchanted: false)
  Tile.create(name: "badvalley", tile_type: 'valley', enchanted: false)
  Tile.create(name: "maple woods", tile_type: 'woods', enchanted: false)
  Tile.create(name: "nutwoods", tile_type: 'woods', enchanted: false)
  Tile.create(name: "mountain", tile_type: 'mountain', enchanted: false)
  Tile.create(name: "caves", tile_type: 'cave', enchanted: false)
  Tile.create(name: "ruins", tile_type: 'cave', enchanted: false)
  Tile.create(name: "awfulvalley", tile_type: 'valley', enchanted: false)
  Tile.create(name: "pinewoods", tile_type: 'woods', enchanted: false)
  Tile.create(name: "lindenwoods", tile_type: 'woods', enchanted: false)

  ## Clearings
  ## Tile 1 - Cliff
  Clearing.create(tile_id: 1, movement_type: 'mountain', movement_value: 2, clearing_number: 4, exit: false, x:418, y:148)
  Clearing.create(tile_id: 1, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:485, y:148)
  Clearing.create(tile_id: 1, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: true, x:397, y:111)
  Clearing.create(tile_id: 1, movement_type: 'mountain', movement_value: 2, clearing_number: 0, exit: true, x:508, y:111)
  Clearing.create(tile_id: 1, movement_type: 'mountain', movement_value: 2, clearing_number: 6, exit: false, x:386, y:204)
  Clearing.create(tile_id: 1, movement_type: 'wood', movement_value: 1, clearing_number: 3, exit: false, x:453, y:204)
  Clearing.create(tile_id: 1, movement_type: 'mountain', movement_value: 2, clearing_number: 1, exit: false, x:420, y:262)
  Clearing.create(tile_id: 1, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:483, y:262)
  ## Tile 2 - Evil Valley
  Clearing.create(tile_id: 2, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: true, x:290, y:294)
  Clearing.create(tile_id: 2, movement_type: 'wood', movement_value: 1, clearing_number: 1, exit: false, x:309, y:333)
  Clearing.create(tile_id: 2, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:375, y:333)
  Clearing.create(tile_id: 2, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:310, y:447)
  Clearing.create(tile_id: 2, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:404, y:422)
  ## Tile 3 - Ledges
  Clearing.create(tile_id: 3, movement_type: 'wood', movement_value: 1, clearing_number: 3, exit: false, x:815, y:388)
  Clearing.create(tile_id: 3, movement_type: 'mountain', movement_value: 2, clearing_number: 2, exit: false, x:805, y:448)
  Clearing.create(tile_id: 3, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:724, y:376)
  Clearing.create(tile_id: 3, movement_type: 'wood', movement_value: 1, clearing_number: 1, exit: false, x:743, y:322)
  Clearing.create(tile_id: 3, movement_type: 'wood', movement_value: 1, clearing_number: 6, exit: false, x:793, y:340)
  Clearing.create(tile_id: 3, movement_type: 'mountain', movement_value: 2, clearing_number: 5, exit: false, x:750, y:427)
  ## Tile 4 - Crag
  Clearing.create(tile_id: 4, movement_type: 'mountain', movement_value: 2, clearing_number: 1, exit: false, x:572, y:342)
  Clearing.create(tile_id: 4, movement_type: 'mountain', movement_value: 2, clearing_number: 4, exit: false, x:555, y:392)
  Clearing.create(tile_id: 4, movement_type: 'mountain', movement_value: 2, clearing_number: 6, exit: false, x:623, y:350)
  Clearing.create(tile_id: 4, movement_type: 'mountain', movement_value: 2, clearing_number: 5, exit: false, x:576, y:453)
  Clearing.create(tile_id: 4, movement_type: 'mountain', movement_value: 2, clearing_number: 3, exit: false, x:515, y:336)
  Clearing.create(tile_id: 4, movement_type: 'mountain', movement_value: 2, clearing_number: 2, exit: false, x:494, y:387)
  ## Tile 5 - Dark Valley
  Clearing.create(tile_id: 5, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:971, y:361)
  Clearing.create(tile_id: 5, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:1048, y:394)
  Clearing.create(tile_id: 5, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:956, y:447)
  Clearing.create(tile_id: 5, movement_type: 'wood', movement_value: 1, clearing_number: 1, exit: false, x:1019, y:448)
  Clearing.create(tile_id: 5, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: true, x:1041, y:297)
  Clearing.create(tile_id: 5, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: true, x:931, y:297)
  Clearing.create(tile_id: 5, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: true, x:1096, y:394)
  ## Tile 6 - High Pass
  Clearing.create(tile_id: 6, movement_type: 'mountain', movement_value: 2, clearing_number: 0, exit: true, x:128, y:578)
  Clearing.create(tile_id: 6, movement_type: 'mountain', movement_value: 2, clearing_number: 5, exit: false, x:173, y:578)
  Clearing.create(tile_id: 6, movement_type: 'mountain', movement_value: 2, clearing_number: 4, exit: false, x:228, y:561)
  Clearing.create(tile_id: 6, movement_type: 'cave',     movement_value: 1, clearing_number: 6, exit: false, x:271, y:518)
  Clearing.create(tile_id: 6, movement_type: 'mountain', movement_value: 2, clearing_number: 1, exit: false, x:218, y:624)
  Clearing.create(tile_id: 6, movement_type: 'cave',     movement_value: 1, clearing_number: 3, exit: false, x:269, y:635)
  Clearing.create(tile_id: 6, movement_type: 'mountain', movement_value: 2, clearing_number: 2, exit: false, x:302, y:575)
  ## Tile 7 - Borderland
  Clearing.create(tile_id: 7, movement_type: 'wood', movement_value: 1, clearing_number: 1, exit: false, x:382, y:616)
  Clearing.create(tile_id: 7, movement_type: 'wood', movement_value: 1, clearing_number: 3, exit: false, x:390, y:544)
  Clearing.create(tile_id: 7, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:444, y:510)
  Clearing.create(tile_id: 7, movement_type: 'cave', movement_value: 1, clearing_number: 6, exit: false, x:434, y:584)
  Clearing.create(tile_id: 7, movement_type: 'cave', movement_value: 1, clearing_number: 5, exit: false, x:478, y:606)
  Clearing.create(tile_id: 7, movement_type: 'cave', movement_value: 1, clearing_number: 4, exit: false, x:525, y:617)
  ## Tile 8 - Oak Woods
  Clearing.create(tile_id: 8, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:613, y:551)
  Clearing.create(tile_id: 8, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:731, y:576)
  Clearing.create(tile_id: 8, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:667, y:634)
  ## Tile 9 - Deep Woods
  Clearing.create(tile_id: 9, movement_type: 'wood', movement_value: 1, clearing_number: 1, exit: false, x:816, y:549)
  Clearing.create(tile_id: 9, movement_type: 'wood', movement_value: 1, clearing_number: 6, exit: false, x:881, y:587)
  Clearing.create(tile_id: 9, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:811, y:619)
  Clearing.create(tile_id: 9, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:861, y:648)
  Clearing.create(tile_id: 9, movement_type: 'wood', movement_value: 1, clearing_number: 3, exit: false, x:933, y:620)
  Clearing.create(tile_id: 9, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:936, y:543)
  ## Tile 10 - Curst Valley
  Clearing.create(tile_id: 10, movement_type: 'wood', movement_value: 1, clearing_number: 1, exit: false, x:1060, y:517)
  Clearing.create(tile_id: 10, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:1026, y:574)
  Clearing.create(tile_id: 10, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:1124, y:520)
  Clearing.create(tile_id: 10, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:1110, y:607)
  Clearing.create(tile_id: 10, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: false, x:1150, y:488)
  Clearing.create(tile_id: 10, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: false, x:1202, y:577)
  ## Tile 11 - Cavern
  Clearing.create(tile_id: 11, movement_type: 'cave', movement_value: 1, clearing_number: 5, exit: false, x:313, y:705)
  Clearing.create(tile_id: 11, movement_type: 'cave', movement_value: 1, clearing_number: 2, exit: false, x:379, y:698)
  Clearing.create(tile_id: 11, movement_type: 'cave', movement_value: 1, clearing_number: 3, exit: false, x:349, y:747)
  Clearing.create(tile_id: 11, movement_type: 'cave', movement_value: 1, clearing_number: 1, exit: false, x:419, y:763)
  Clearing.create(tile_id: 11, movement_type: 'cave', movement_value: 1, clearing_number: 6, exit: false, x:351, y:797)
  Clearing.create(tile_id: 11, movement_type: 'cave', movement_value: 1, clearing_number: 4, exit: false, x:311, y:825)
  ## Tile 12 - Bad Valley
  Clearing.create(tile_id: 12, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:504, y:795)
  Clearing.create(tile_id: 12, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:527, y:705)
  Clearing.create(tile_id: 12, movement_type: 'wood', movement_value: 1, clearing_number: 1, exit: false, x:591, y:704)
  Clearing.create(tile_id: 12, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:592, y:816)
  ## Tile 13 - Maple Woods
  Clearing.create(tile_id: 13, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:771, y:710)
  Clearing.create(tile_id: 13, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:740, y:823)
  Clearing.create(tile_id: 13, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:821, y:796)
  ## Tile 14 - Nut Woods
  Clearing.create(tile_id: 14, movement_type: 'wood', movement_value: 1, clearing_number: 3, exit: false, x:972, y:732)
  Clearing.create(tile_id: 14, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:962, y:822)
  Clearing.create(tile_id: 14, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:1038, y:796)
  Clearing.create(tile_id: 14, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: true, x:1095, y:761)
  ## Tile 15 - Mountain
  Clearing.create(tile_id: 15, movement_type: 'wood',     movement_value: 1, clearing_number: 0, exit: false, x:345,y:949)
  Clearing.create(tile_id: 15, movement_type: 'wood',     movement_value: 1, clearing_number: 4, exit: false, x:380,y:949)
  Clearing.create(tile_id: 15, movement_type: 'wood',     movement_value: 1, clearing_number: 6, exit: false, x:426,y:903)
  Clearing.create(tile_id: 15, movement_type: 'mountain', movement_value: 2, clearing_number: 5, exit: false, x:489,y:887)
  Clearing.create(tile_id: 15, movement_type: 'mountain', movement_value: 2, clearing_number: 1, exit: false, x:427,y:989)
  Clearing.create(tile_id: 15, movement_type: 'mountain', movement_value: 2, clearing_number: 3, exit: false, x:487,y:951)
  Clearing.create(tile_id: 15, movement_type: 'wood',     movement_value: 1, clearing_number: 2, exit: false, x:489,y:1011)
  ## Tile 16 - Caves
  Clearing.create(tile_id: 16, movement_type: 'cave', movement_value: 1, clearing_number: 4, exit: false, x:602,y:931)
  Clearing.create(tile_id: 16, movement_type: 'cave', movement_value: 1, clearing_number: 2, exit: false, x:634,y:891)
  Clearing.create(tile_id: 16, movement_type: 'cave', movement_value: 1, clearing_number: 3, exit: false, x:666,y:939)
  Clearing.create(tile_id: 16, movement_type: 'cave', movement_value: 1, clearing_number: 5, exit: false, x:697,y:891)
  Clearing.create(tile_id: 16, movement_type: 'cave', movement_value: 1, clearing_number: 1, exit: false, x:630,y:1006)
  Clearing.create(tile_id: 16, movement_type: 'cave', movement_value: 1, clearing_number: 6, exit: false, x:732,y:979)
  ## Tile 17 - Ruins
  Clearing.create(tile_id: 17, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:821,y:897)
  Clearing.create(tile_id: 17, movement_type: 'wood', movement_value: 1, clearing_number: 1, exit: false, x:911,y:903)
  Clearing.create(tile_id: 17, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:856,y:942)
  Clearing.create(tile_id: 17, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: false, x:824,y:1040)
  Clearing.create(tile_id: 17, movement_type: 'wood', movement_value: 1, clearing_number: 3, exit: false, x:844,y:1009)
  Clearing.create(tile_id: 17, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:942,y:985)
  ## Tile 18 - Awful Valley
  Clearing.create(tile_id: 18, movement_type: 'wood', movement_value: 1, clearing_number: 1, exit: false, x:1025,y:950)
  Clearing.create(tile_id: 18, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:1059,y:894)
  Clearing.create(tile_id: 18, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:1128,y:980)
  Clearing.create(tile_id: 18, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:1058,y:1005)
  Clearing.create(tile_id: 18, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: false, x:1148,y:858)
  Clearing.create(tile_id: 18, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: false, x:1200,y:948)
  ## Tile 19 - Pine Woods
  Clearing.create(tile_id: 19, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:517,y:1081)
  Clearing.create(tile_id: 19, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: false, x:451,y:1136)
  Clearing.create(tile_id: 19, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:498,y:1158)
  Clearing.create(tile_id: 19, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: false, x:502,y:1229)
  Clearing.create(tile_id: 19, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:606,y:1105)
  Clearing.create(tile_id: 19, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: false, x:668,y:1132)
  ## Tile 20 - Linden Woods
  Clearing.create(tile_id: 20, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: false, x:883,y:1132)
  Clearing.create(tile_id: 20, movement_type: 'wood', movement_value: 1, clearing_number: 2, exit: false, x:971,y:1159)
  Clearing.create(tile_id: 20, movement_type: 'wood', movement_value: 1, clearing_number: 4, exit: false, x:952,y:1080)
  Clearing.create(tile_id: 20, movement_type: 'wood', movement_value: 1, clearing_number: 5, exit: false, x:1032,y:1109)
  Clearing.create(tile_id: 20, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: false, x:1091,y:1134)
  Clearing.create(tile_id: 20, movement_type: 'wood', movement_value: 1, clearing_number: 0, exit: false, x:1040,y:1228)
  ## Tile 17 - Ruins (again)
  Clearing.create(tile_id: 17, movement_type: 'cave', movement_value: 1, clearing_number: 6, exit: false, x:896,y:990)

travs = [
   ## Tile 1 - Cliff
  {:id => 1, :trav => [4,5], :e_trav => [4,5], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 2, :trav => [3, 6, 8], :e_trav => [3, 6, 8],  :hidden => 8, :hidden_type => 'path', :e_hidden => 8, :e_hidden_type => 'path'},
  {:id => 3, :trav => [2], :e_trav => [2], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 4, :trav => [1], :e_trav => [1], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 5, :trav => [1, 7, 6], :e_trav => [1, 7, 6],  :hidden => 6, :hidden_type => 'passage',  :e_hidden => 6, :e_hidden_type => 'passage'},
  {:id => 6, :trav => [2,5,8], :e_trav => [2,5,8],  :hidden => 5, :hidden_type => 'passage', :e_hidden => 5, :e_hidden_type => 'passage'},
  {:id => 7, :trav => [5,11], :e_trav => [5,11], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 8, :trav => [2,6,14], :e_trav => [2,6,14],  :hidden => 2, :hidden_type => 'path', :e_hidden => 2, :e_hidden_type => 'path'},
  ## Tile 2 - Evil Valley
  {:id => 9, :trav => [10], :e_trav => [10],  :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 10, :trav => [9,13], :e_trav => [9,13],  :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 11, :trav => [7,12], :e_trav => [7,12], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 12, :trav => [11, 36], :e_trav => [11, 36], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 13, :trav => [10,15,42], :e_trav => [10,15,42], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 3 - Ledges
  {:id => 14, :trav => [8,17,18], :e_trav => [8,17,18], :hidden => 17, :hidden_type => 'path', :e_hidden => nil, :e_hidden_type => nil},
  {:id => 15, :trav => [13,19], :e_trav => [13,19],  :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 16, :trav => [17,18,45], :e_trav => [17,18,45], :hidden => 18, :hidden_type => 'path', :e_hidden => nil, :e_hidden_type => nil},
  {:id => 17, :trav => [14,16,18], :e_trav => [14,16], :hidden => 14, :hidden_type => 'path', :e_hidden => nil, :e_hidden_type => nil},
  {:id => 18, :trav => [14,16,17], :e_trav => [14,16], :hidden => 16, :hidden_type => 'path', :e_hidden => nil, :e_hidden_type => nil},
  {:id => 19, :trav => [15, 46], :e_trav => [15, 46], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 4 - Crag
  {:id => 20, :trav => [21,22], :e_trav => [21], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 21, :trav => [20,22], :e_trav => [20,22,23], :hidden => nil, :hidden_type => nil, :e_hidden => 23, :e_hidden_type => 'passage'},
  {:id => 22, :trav => [20,21], :e_trav => [21], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 23, :trav => [24,25], :e_trav => [24,25,21], :hidden => nil, :hidden_type => nil, :e_hidden => 21, :e_hidden_type => 'passage'},
  {:id => 24, :trav => [22,23,25], :e_trav => [22,23,25], :hidden => 25, :hidden_type => 'path', :e_hidden => nil, :e_hidden_type => nil},
  {:id => 25, :trav => [23,49,24], :e_trav => [23,49,24], :hidden => 24, :hidden_type => 'path', :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 5 - Dark Valley
  {:id => 26, :trav => [29,30,31], :e_trav => [29,30,31], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 27, :trav => [28,32], :e_trav => [28,32], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 28, :trav => [27,54], :e_trav => [27,54], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 29, :trav => [26,56], :e_trav => [26,56], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 30, :trav => [26], :e_trav => [26], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 31, :trav => [26], :e_trav => [26], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 32, :trav => [27], :e_trav => [27], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 6 - High Pass
  {:id => 33, :trav => [34], :e_trav => [34], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 34, :trav => [33,37], :e_trav => [33,37], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 35, :trav => [37,39], :e_trav => [37,39], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 36, :trav => [12,38], :e_trav => [12,38], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 37, :trav => [34,35], :e_trav => [34,35], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 38, :trav => [36,61], :e_trav => [36,61], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 39, :trav => [35,40], :e_trav => [35,40], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 7 - Borderland
  {:id => 40, :trav => [39,68,43], :e_trav => [39,68], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 41, :trav => [42,43], :e_trav => [42,43], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 42, :trav => [13,41], :e_trav => [13,41], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 43, :trav => [40,41,45], :e_trav => [40,41,45], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 44, :trav => [41,45,62], :e_trav => [41,45,62], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 45, :trav => [44,43,16], :e_trav => [44,43,16], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 8 - Oak Woods
  {:id => 46, :trav => [42,47], :e_trav => [42], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 47, :trav => [46,49], :e_trav => [48,49], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 48, :trav => [69,71], :e_trav => [47,69,71], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 9 - Deep Woods
  {:id => 49, :trav => [25,47,50,51], :e_trav => [51,53], :hidden => 51, :hidden_type => 'path', :e_hidden => nil, :e_hidden_type => nil},
  {:id => 50, :trav => [49,51,53], :e_trav => [54,51,53], :hidden => 53, :hidden_type => 'path', :e_hidden => 51, :e_hidden_type => 'path'},
  {:id => 51, :trav => [49,50,52], :e_trav => [49,50,53], :hidden => 49, :hidden_type => 'path', :e_hidden => 53, :e_hidden_type => 'path'},
  {:id => 52, :trav => [51,53,71], :e_trav => [54,53], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 53, :trav => [50,52,54], :e_trav => [49,52,51,50], :hidden => 50, :hidden_type => 'path', :e_hidden => 50, :e_hidden_type => 'path'},
  {:id => 54, :trav => [28,53,55], :e_trav => [50,52], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 10 - Curst Valley
  {:id => 55, :trav => [29,54,57], :e_trav => [29,54,57], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 56, :trav => [54,58], :e_trav => [54,58], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 57, :trav => [55, 59], :e_trav => [55, 59], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 58, :trav => [56,60,74], :e_trav => [56,60,74], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 59, :trav => [57], :e_trav => [57], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 60, :trav => [58], :e_trav => [58], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 11 - Cavern
  {:id => 61, :trav => [38,63,66], :e_trav => [63,66], :hidden => 63, :hidden_type => 'passage', :e_hidden => 66, :e_hidden_type => 'passage'},
  {:id => 62, :trav => [44,63], :e_trav => [65,64], :hidden => nil, :hidden_type => nil, :e_hidden => 64, :e_hidden_type => 'passage'},
  {:id => 63, :trav => [62,61,64,65], :e_trav => [61,65], :hidden => 61, :hidden_type => 'passage', :e_hidden => nil, :e_hidden_type => nil},
  {:id => 64, :trav => [63,67,66], :e_trav => [66,62], :hidden => 66, :hidden_type => 'passage', :e_hidden => 62, :e_hidden_type => 'passage'},
  {:id => 65, :trav => [63,66], :e_trav => [62,63,66], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 66, :trav => [61,64,65], :e_trav => [64,61,65], :hidden => 64, :hidden_type => 'passage', :e_hidden => 65, :e_hidden_type => 'passage'},
  ## Tile 12 - Bad Valley
  {:id => 67, :trav => [64,69,81], :e_trav => [64,69,81],  :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 68, :trav => [40,70], :e_trav => [40,70], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 69, :trav => [48,67], :e_trav => [48,67], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 70, :trav => [68,86], :e_trav => [68,86],  :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 13 - Maple Woods
  {:id => 71, :trav => [48,52], :e_trav => [48,52,72], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 72, :trav => [73,88], :e_trav => [71,88],  :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 73, :trav => [72,74,91], :e_trav => [74,91], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 14 - Nut Woods
  {:id => 74, :trav => [58,73], :e_trav => [58,73,75], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 75, :trav => [76,92], :e_trav => [74,92],  :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 76, :trav => [75,77,98], :e_trav => [77,98], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 77, :trav => [76], :e_trav => [76], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 15 - Mountain
  {:id => 78, :trav => [79], :e_trav => [79], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 79, :trav => [80,84], :e_trav => [80,84,82], :hidden => 80, :hidden_type => 'path', :e_hidden => 82, :e_hidden_type => 'path'},
  {:id => 80, :trav => [79,81,83], :e_trav => [79,81,83], :hidden => 79, :hidden_type => 'path', :e_hidden => nil, :e_hidden_type => nil},
  {:id => 81, :trav => [67,80,84], :e_trav => [67,80,84], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 82, :trav => [83],  :e_trav => [79,83], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 83, :trav => [80,82], :e_trav => [80,82], :hidden => nil, :hidden_type => nil, :e_hidden => 79, :e_hidden_type => 'path'},
  {:id => 84, :trav => [79,81], :e_trav => [79,81], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 16 - Caves
  {:id => 85, :trav => [86,90], :e_trav => [87,89], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 86, :trav => [70,85,87], :e_trav => [87],  :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 87, :trav => [86,88], :e_trav => [85,86], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 88, :trav => [72,87], :e_trav => [89,87],  :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 89, :trav => [90,107], :e_trav => [85,90], :hidden => nil, :hidden_type => nil, :e_hidden => 90, :e_hidden_type => 'passage'},
  {:id => 90, :trav => [85,89], :e_trav => [88,89], :hidden => nil, :hidden_type => nil, :e_hidden => 89, :e_hidden_type => 'passage'},
  ## Tile 17 - Ruins
  {:id => 91, :trav => [73,92,95], :e_trav => [73,92,95], :hidden => 92, :hidden_type => 'path', :e_hidden => nil, :e_hidden_type => nil},
  {:id => 92, :trav => [75,91,93,96], :e_trav => [75,91,96,93], :hidden => 91, :hidden_type => 'path', :e_hidden => 96, :e_hidden_type => 'path'},
  {:id => 93, :trav => [115], :e_trav => [115,92], :hidden => nil, :hidden_type => nil, :e_hidden => 92, :e_hidden_type => 'path'},
  {:id => 94, :trav => [95], :e_trav => [95], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 95, :trav => [91,94,115], :e_trav => [91,94,115], :hidden => nil, :hidden_type => nil, :e_hidden => 115, :e_hidden_type => 'passage'},
  {:id => 96, :trav => [92,111], :e_trav => [92,115], :hidden => nil, :hidden_type => nil, :e_hidden => 115, :e_hidden_type => 'path'},
  ## Tile 18 - Awful Valley
  {:id => 97, :trav => [96,99], :e_trav => [96,99], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 98, :trav => [76,100], :e_trav => [76,100],  :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 99, :trav => [97,101,102], :e_trav => [97,101,102], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 100, :trav => [98,112], :e_trav => [98,112], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 101, :trav => [99], :e_trav => [99], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 102, :trav => [99], :e_trav => [99], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 19 - Pine Woods
  {:id => 103, :trav => [84,105], :e_trav => [84,105], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 104, :trav => [105], :e_trav => [105], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 105, :trav => [104,106], :e_trav => [104,106], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 106, :trav => [105], :e_trav => [105], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 107, :trav => [89,108], :e_trav => [89,108], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 108, :trav => [107], :e_trav => [107], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 20 - Linden Woods
  {:id => 109, :trav => [110], :e_trav => [110], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 110, :trav => [114,109,111], :e_trav => [114,109], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 111, :trav => [96,110], :e_trav => [96,112], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 112, :trav => [113,100], :e_trav => [112,113,100], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 113, :trav => [112], :e_trav => [112], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  {:id => 114, :trav => [110], :e_trav => [110], :hidden => nil, :hidden_type => nil, :e_hidden => nil, :e_hidden_type => nil},
  ## Tile 17 - Ruins (again)
  {:id => 115, :trav => [93,95], :e_trav => [93,96,95,111], :hidden => nil, :hidden_type => nil, :e_hidden => 96, :e_hidden_type => 'path'}
]




travs.each do |t|
  t[:trav].each do |trav_id|
    t_new = TraversableClearing.new(clearing_id: t[:id], traversable_id: trav_id, hidden: false, enchanted: false)
    t_new.hidden = true if t[:hidden] == trav_id
    t_new.hidden_type = t[:hidden_type]
    t_new.save
  end
  t[:e_trav].each do |e_trav_id|
    t_new = TraversableClearing.new(clearing_id: t[:id], traversable_id: e_trav_id, hidden: false, enchanted: true)
    t_new.hidden = true if t[:e_hidden] == e_trav_id
    t_new.hidden_type = t[:e_hidden_type]
    t_new.save
  end
end

  ## Tiles
tile_travs =[
  {:tl_id => 1,  :adj_tile => [2,3], :directions => ['sw','se']},
  {:tl_id => 2,  :adj_tile => [1,3,6,7], :directions => ['ne','e','sw','se']},
  {:tl_id => 3,  :adj_tile => [1,2,4,7,8], :directions => ['nw','w','e','sw','se']},
  {:tl_id => 4,  :adj_tile => [3,5,8,9], :directions => ['w','e','sw','se']},
  {:tl_id => 5,  :adj_tile => [2,7,11], :directions => ['ne','e','se']},
  {:tl_id => 6,  :adj_tile => [4,9,10], :directions => ['e','sw','se']},
  {:tl_id => 7,  :adj_tile => [2,3,6,8,11,12],  :directions => ['nw','ne','w','e','sw','se']},
  {:tl_id => 8,  :adj_tile => [3,4,7,9,12,13], :directions => ['nw','ne','w','e','sw','se']},
  {:tl_id => 9,  :adj_tile => [4,5,8,10,13,14], :directions => ['nw','ne','w','e','sw','se']},
  {:tl_id => 10, :adj_tile => [5,9,14], :directions => ['nw','w','sw']},
  {:tl_id => 11, :adj_tile => [6,7,12,15], :directions => ['nw','ne','e','se']},
  {:tl_id => 12, :adj_tile => [7,8,11,13,15,16], :directions => ['nw','ne','w','e','sw','se']},
  {:tl_id => 13, :adj_tile => [8,9,12,14,16,17], :directions => ['nw','ne','w','e','sw','se']},
  {:tl_id => 14, :adj_tile => [9,10,13,17,18], :directions => ['nw','ne','w','sw','se']},
  {:tl_id => 15, :adj_tile => [11,12,16,19], :directions => ['nw','ne','e','se']},
  {:tl_id => 16, :adj_tile => [12,13,15,17,19], :directions => ['nw','ne','w','e','sw']},
  {:tl_id => 17, :adj_tile => [13,14,16,18,20], :directions => ['nw','ne','w','e','se']},
  {:tl_id => 18, :adj_tile => [14,17,20], :directions => ['nw','w','sw']},
  {:tl_id => 19, :adj_tile => [15,16], :directions => ['nw','ne']},
  {:tl_id => 20, :adj_tile => [17,18], :directions => ['nw','ne']},
]

tile_travs.each do |tl|
  tl[:adj_tile].each do |adj_tile_id|
    loc = tl[:directions].shift
    tl_new = AdjacentTile.new(tile_id: tl[:tl_id], next_tile_id: adj_tile_id, location: loc)
    tl_new.save
  end
end

## Weapons
Weapon.create(weapon_name: 'Medium Bow', ranged: true, length: 16, price: 8, harm: 2, alerted_harm: 2, time: 0, alerted_time: 1, sharp: 0, alerted_sharp: 2)
Weapon.create(weapon_name: 'Light Bow', ranged: true, length: 14, price: 6, harm: 1, alerted_harm: 1, time: 0, alerted_time: 1, sharp: 0, alerted_sharp: 2)
Weapon.create(weapon_name: 'Crossbow', ranged: true, length: 12, price: 10, harm: 3, alerted_harm: 3, time: 0, alerted_time: 1, sharp: 0, alerted_sharp: 1)
Weapon.create(weapon_name: 'Spear', ranged: false, length: 10, price: 6, harm: 0, alerted_harm: 2, time: 6, alerted_time: 0, sharp: 0, alerted_sharp: 1)
Weapon.create(weapon_name: 'Staff', ranged: false, length: 9, price: 1, harm: 1, alerted_harm: 1, time: 0, alerted_time: 0, sharp: 0, alerted_sharp: 0)
Weapon.create(weapon_name: 'Great Sword', ranged: false, length: 8, price: 10, harm: 3, alerted_harm: 3, time: 6, alerted_time: 0, sharp: 1, alerted_sharp: 1)
Weapon.create(weapon_name: 'Broadsword', ranged: false, length: 7, price: 8, harm: 2, alerted_harm: 2, time: 5, alerted_time: 0, sharp: 1, alerted_sharp: 1)
Weapon.create(weapon_name: 'Morning Star', ranged: false, length: 6, price: 8, harm: 3, alerted_harm: 3, time: 0, alerted_time: 3, sharp: 0, alerted_sharp: 0)
Weapon.create(weapon_name: 'Great Axe', ranged: false, length: 5, price: 8, harm: 3, alerted_harm: 3, time: 0, alerted_time: 4, sharp: 1, alerted_sharp: 1)
Weapon.create(weapon_name: 'Thrusting Sword', ranged: false, length: 4, price: 6, harm: 1, alerted_harm: 1, time: 4, alerted_time: 0, sharp: 1, alerted_sharp: 1)
Weapon.create(weapon_name: 'Short Sword', ranged: false, length: 3, price: 4, harm: 1, alerted_harm: 1, time: 0, alerted_time: 0, sharp: 1, alerted_sharp: 1)
Weapon.create(weapon_name: 'Axe', ranged: false, length: 2, price: 4, harm: 2, alerted_harm: 2, time: 5, alerted_time: 0, sharp: 1, alerted_sharp: 1)
Weapon.create(weapon_name: 'Mace', ranged: false, length: 1, price: 6, harm: 2, alerted_harm: 2, time: 0, alerted_time: 3, sharp: 0, alerted_sharp: 0)

## Armor
Armor.create(armor_name: 'Suit of Armor', armor_type: 'suit', protect_thrust: true, protect_swing: true, protect_smash: true, tremendous: false, price_intact: 17, price_damaged: 12, price_destroyed: 0)
Armor.create(armor_name: 'Breastplate', armor_type: 'breastplate', protect_thrust: true, protect_swing: true, protect_smash: false, tremendous: false, price_intact: 9, price_damaged: 6, price_destroyed: 0)
Armor.create(armor_name: 'Helmet', armor_type: 'helmet', protect_thrust: false, protect_swing: false, protect_smash: true, tremendous: false, price_intact: 5, price_damaged: 3, price_destroyed: 0)
Armor.create(armor_name: 'Shield', armor_type: 'shield', protect_thrust: true, protect_swing: true, protect_smash: true, tremendous: false, price_intact: 7, price_damaged: 5, price_destroyed: 0)
Armor.create(armor_name: 'Tremendous Armor', armor_type: 'suit', protect_thrust: true, protect_swing: true, protect_smash: true, tremendous: true, price_intact: 25, price_damaged: 18, price_destroyed: 5)
Armor.create(armor_name: 'Silver Breastplate', armor_type: 'breastplate', protect_thrust: true, protect_swing: true, protect_smash: false, tremendous: true, price_intact: 25, price_damaged: 21, price_destroyed: 15)
Armor.create(armor_name: 'Gold Helmet', armor_type: 'helmet', protect_thrust: false, protect_swing: false, protect_smash: true, tremendous: true, price_intact: 30, price_damaged: 27, price_destroyed: 20)
Armor.create(armor_name: 'Jade Shield', armor_type: 'shield', protect_thrust: true, protect_swing: true, protect_smash: true, tremendous: false, price_intact: 20, price_damaged: 16, price_destroyed: 10)

## Characters
character_seed = [
  {name: 'Amazon', weapon: 'Short Sword', vulnerability: 12, starting_breastplate: 'Breastplate', starting_helmet: 'Helmet', starting_shield: 'Shield'},
  {name: 'Berserker', weapon: 'Great Axe', vulnerability: 12, starting_helmet: 'Helmet'},
  {name: 'BlackKnight', weapon: 'Mace', vulnerability: 12, starting_suit: 'Suit of Armor', starting_shield: 'Shield'},
  {name: 'Captain', weapon: 'Short Sword', vulnerability: 12, starting_breastplate: 'Breastplate', starting_helmet: 'Helmet', starting_shield: 'Shield'},
  {name: 'Druid', vulnerability: 12},
  {name: 'Dwarf', weapon: 'Great Axe', vulnerability: 12, starting_helmet: 'Helmet'},
  {name: 'Magician', vulnerability: 12},
  {name: 'Pilgrim', weapon: 'Staff', vulnerability: 12},
  {name: 'Elf', weapon: 'Light Bow', vulnerability: 12},
  {name: 'Sorceror', vulnerability: 12},
  {name: 'Swordsman', weapon: 'Thrusting Sword', vulnerability: 12},
  {name: 'WhiteKnight', weapon: 'Great Sword', vulnerability: 12, starting_suit: 'Suit of Armor'},
  {name: 'Witch', vulnerability: 12},
  {name: 'WitchKing', vulnerability: 12},
  {name: 'Wizard', weapon: 'Staff', vulnerability: 12},
  {name: 'WoodsGirl', weapon: 'Light Bow', vulnerability: 12}
]

character_seed.each do |cs|

  weapon = Weapon.where(weapon_name: cs[:weapon]).first.id if cs[:weapon].present?
  suit = Armor.where(armor_name: cs[:starting_suit]).first.id if cs[:starting_suit].present?
  breastplate = Armor.where(armor_name: cs[:starting_breastplate]).first.id if cs[:starting_breastplate].present?
  helmet = Armor.where(armor_name: cs[:starting_helmet]).first.id if cs[:starting_helmet].present?
  shield = Armor.where(armor_name: cs[:starting_shield]).first.id if cs[:starting_shield].present?
  CharacterClass.create(name: cs[:name],
                        vulnerability: cs[:vulnerability],
                        movement_cost: 1,
                        cave_movement_cost: 1,
                        mountain_movement_cost: 2,
                        starting_weapon_id: weapon,
                        starting_suit_id: suit,
                        starting_breastplate_id: breastplate,
                        starting_helmet_id: helmet,
                        starting_shield_id: shield,
                        starting_gold: 10)
end

game = Game.create(turn: 1, prowling_row: 0, complete: false, name: "seeded game")
game.players_ready!

Player.create(game_id: game.id, first_name: 'Joe', last_name: 'Blow', character_class_id: 1, wounds: 0, fatigue: 0)
# Player.create(game_id: game.id, first_name: 'Jim', last_name: 'Vim', character_class_id: 2, wounds: 0, fatigue: 0)

game2 = Game.create(turn: 1, prowling_row: 0)

Player.create(wounds: 0, fatigue: 0, game_id: game2.id, first_name: 'Joe', last_name: 'Blow', character_class_id: 2, clearing_id: 2, fame_vps: 0, notoriety_vps: 0)
Player.create(wounds: 0, fatigue: 0, game_id: game2.id, first_name: 'Jim', last_name: 'Blow', character_class_id: 4, clearing_id: 2, fame_vps: 0, notoriety_vps: 0)
game2.players_ready!


Monster.create(monster: 'wolf', vulnerability: 2, wounds: 0, fatigue: 0, clearing_id: 2, game_id: game2.id, clearing_id: 68, url: 'wolf.gif', fame_reward: 2, notoriety_reward: 2)
Monster.create(monster: 'wolf', vulnerability: 2, wounds: 0, fatigue: 0, clearing_id: 2, game_id: game2.id, clearing_id: 68, url: 'wolf.gif', fame_reward: 2, notoriety_reward: 2)
Monster.create(monster: 'wolf', vulnerability: 2, wounds: 0, fatigue: 0, clearing_id: 2, game_id: game2.id, clearing_id: 68, url: 'wolf.gif', fame_reward: 2, notoriety_reward: 2)
Monster.create(monster: 'wolf', vulnerability: 2, wounds: 0, fatigue: 0, clearing_id: 2, game_id: game2.id, clearing_id: 68, url: 'wolf.gif', fame_reward: 2, notoriety_reward: 2)
Monster.create(monster: 'wolf', vulnerability: 2, wounds: 0, fatigue: 0, clearing_id: 2, game_id: game2.id, clearing_id: 68, url: 'wolf.gif', fame_reward: 2, notoriety_reward: 2)


