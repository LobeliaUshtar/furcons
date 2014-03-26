module ApplicationHelper
	def page_title
		if content_for?(:title)
			content_tag(:title, "Furcons - #{content_for(:title)}")
		else
			content_tag(:title, "Furcons")
		end
	end

	def nav_link_to(text, url)
		classes = ['button']
		classes << 'active' if current_page?(url)
		link_to(text, url, class: classes.join(' '))
	end
end