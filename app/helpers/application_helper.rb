module ApplicationHelper
	def d_tabla(controller, label)
		controller.classify.constantize::D_TABLA[label]
	end
	def m_tabs(controller)
		controller.classify.constantize::TABS
	end
	def m_estados(controller)
		controller.classify.constantize::ESTADOS
	end

	def get_link(c, var)
		case var
		when 'ftab'
			"/#{controller_name}/#{action_name}?ftab="
		when 'tab'
			controller_name == c ? "/#{controller_name}/#{action_name}?tab=" : "/#{controller_name}/#{action_name}?ftab=#{@ftab}&tab="
		when 'estado'
			if controller_name == c
				m_tabs(c).empty? ? "/#{controller_name}/#{action_name}?estado=" : "/#{controller_name}/#{action_name}?tab=#{@tab}&estado="
			else
				m_tabs(c).empty? ? "/#{controller_name}/#{action_name}?ftab=#{@ftab}&estado=" : "/#{controller_name}/#{action_name}?ftab=#{@ftab}&tab=#{@tab}&estado="
			end
		end
	end

	def corrige(w)
		case w
		when 'Controlador'
			'label'
		else
			w.capitalize
		end
	end

	def has_child?(objeto)
		objeto.class.reflect_on_all_associations.map { |a| objeto.send(a.name).any? }.include?(true)
	end
	def link_estado(objeto)
		"/#{objeto.class.downcase.pluralize}/estado?estado="
	end
end
