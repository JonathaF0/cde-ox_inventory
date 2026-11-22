return {
	['gov_id'] = {
		label = 'Government ID',
		weight = 10,
		stack = false,
		close = true,
		consume = 0,
		server = { export = 'cde-core.useGovId' },
	},

	['fuel_card'] = {
		label = 'Fuel card',
		weight = 5,
		stack = false,
		close = true,
	},

	['licence_card'] = { label = 'Licence card', weight = 10, stack = false, close = true, consume = 0, server = { export = 'cde-core.useDocument' } },
	['vehicle_registration'] = { label = 'Vehicle registration', weight = 10, stack = false, close = true, consume = 0, server = { export = 'cde-core.useDocument' } },
	['citation_ticket'] = { label = 'Citation', weight = 5, stack = false, close = true, consume = 0, server = { export = 'cde-core.useDocument' } },

	['beer'] = { label = 'Beer', weight = 500 },
	['wine'] = { label = 'Wine', weight = 1000 },
	['whiskey'] = { label = 'Whiskey', weight = 1000 },
	['vodka'] = { label = 'Vodka', weight = 1000 },
	['joint'] = { label = 'Joint', weight = 5 },
	['cocaine'] = { label = 'Cocaine', weight = 10 },
	['meth'] = { label = 'Meth', weight = 10 },
	['oxy'] = { label = 'Oxycodone', weight = 50 },
	['ecstasy'] = { label = 'Ecstasy', weight = 20 },

	['breathalyzer'] = { label = 'Breathalyzer', weight = 300, stack = false },
	['drug_swab'] = { label = 'Drug swab', weight = 30 },
}
