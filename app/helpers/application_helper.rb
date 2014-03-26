module ApplicationHelper
	def page_title
		if content_for?(:title)
			content_tag(:title, "Furcons - #{content_for(:title)}")
		else
			content_tag(:title, "Furcons")
		end
	end
end