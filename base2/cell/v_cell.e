note
	description: "Cells containing an item."
	author: "Nadia Polikarpova"
	model: item

class
	V_CELL [G]

create
	put

feature -- Access

	item: G
			-- Content of the cell.
		note
			guard: True
		attribute
		end

feature -- Replacement

	put (v: G)
			-- Replace `item' with `v'.
		require
			modify_model ("item", Current)
		do
			item := v
		ensure
			item_effect: item = v
		end

note
	explicit: subjects, observers
end
