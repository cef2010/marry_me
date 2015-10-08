module StiHelper
	def sti_vendor_path(type = 'vendor', vendor = nil, action = nil)
		send "#{format_sti(action, type, vendor)}_path", vendor
	end

	def format_sti(action, type, vendor)
		action || vendor ?
		"#{format_action(action)}#{type.underscore}" :
		"#{type.underscore.pluralize}"
	end

	def format_action(action)
		if action "#{action}_"
		end
	end
end