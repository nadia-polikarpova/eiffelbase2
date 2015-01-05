note
	description: "Cells that can be linked to another cell."
	author: "Nadia Polikarpova"
	model: item, right
	false_guards: true

class
	V_LINKABLE [G]

inherit
	V_CELL [G]

create
	put

feature -- Access

	right: V_LINKABLE [G]
			-- Next cell.

feature -- Replacement

	put_right (cell: V_LINKABLE [G])
			-- Replace `right' with `cell'.
		note
			explicit: contracts
		require
			wrapped: is_wrapped
			modify_model ("right", Current)
		do
			right := cell
		ensure
			wrapped: is_wrapped
			right_effect: right = cell
		end

end
