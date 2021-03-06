note
	description: "[
		Containers that use a lock to protect their items.
		]"
	author: "Nadia Polikarpova"
	status: ghost
	model: lock, locked
	manual_inv: true
	false_guards: true

deferred class
	V_LOCKER [G]

feature -- Specification

	locked: MML_SET [G]
			-- Locked items.

	lock: V_LOCK [G]
			-- Lock.

	no_duplicates (s: MML_SET [G]): BOOLEAN
			-- Are all objects in `s' unique by object comparison?
		note
			status: functional, nonvariant
		require
			lock_exists: lock /= Void
			non_void: s.non_void
			reads_field ("lock", Current)
			reads_field ("equivalence", lock)
		do
			Result := across s as x all across s as y all x.item /= y.item implies not lock.equivalence [x.item, y.item] end end
		end

invariant
	lock_exists: lock /= Void
	locked_non_void: locked.non_void
	lock_non_current: lock /= Current
	subjects_definition: subjects = [lock]
	items_locked: locked <= lock.locked
	no_duplicates: no_duplicates (locked)

end
