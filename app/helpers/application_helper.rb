module ApplicationHelper
	def d_tabla(controller, label)
		controller.classify.constantize::D_TABLA[label]
	end
	def m_tabs(controller)
		controller.classify.constantize::TABS
	end
	def m_link_tabs(controller)
		controller.classify.constantize::LINK_TABS
	end

end
