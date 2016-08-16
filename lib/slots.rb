class Slots
def self.results(slot_1, slot_2, slot_3)
if slot_1 == slot_2 && slot_1 == slot_3
@results = 'jackpot'
elsif slot_1 == slot_2 || slot_2 == slot_3
@results = 'win'
else
@results = 'lose'
end
end
end
