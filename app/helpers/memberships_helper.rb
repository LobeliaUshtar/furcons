module MembershipsHelper
	def format_prereg_fee(membership)
		if membership.prna?
			content_tag(:strong, '~*~')
		else
			number_to_currency(membership.prereg_fee)
		end
	end
end