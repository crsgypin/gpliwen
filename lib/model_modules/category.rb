
module ModelModules

	module Category

		def check_order
			if !self.order.present?
				self.order = (self.class.name.constantize.maximum(:order)||0) +1
			end
		end
	end
end

