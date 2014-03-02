module FurconsHelper
	def format_charity(furcon)
		if furcon.charity?
			content_tag(:strong, 'No Charity Yet')
		else
			furcon.charities
		end
	end
	def image_for(furcon)
		if furcon.image_file_name.blank?
			image_tag('placeholder.gif')
		else
			image_tag(furcon.image_file_name)
		end
	end
end