module ApplicationHelper
	def d_tabla(controller, label)
		controller.classify.constantize::D_TABLA[label]
	end
	def d_show(controller, label)
		controller.classify.constantize::D_SHOW[label]
	end
	def m_tabs(controller)
		controller.classify.constantize::TABS
	end
	def m_estados(controller)
		controller.classify.constantize::ESTADOS
	end

	def has_many_tabs(controller)
		controller.classify.constantize.reflect_on_all_associations.map {|a| a.name.to_s} - Recurso::NO_TABLAS
	end

	def get_new_link(controller)
		case controller.classify.constantize::TIPO_NEW
		when 'normal'
			"/#{controller}/new"
		when 'child'
			"/#{controller.classify.constantize::PADRE}/#{@objeto.id}/#{controller}/new"
		when 'seleccion'
			controller.classify.constantize::LINK_SELECCION
		when 'child_sel'
			"#{controller.classify.constantize::LINK_SELECCION}?#{controller.classify.constantize::PADRE.singularize}_id=#{@objeto.id}"
		when 'through'
			"/#{controller}/new?#{controller.classify.constantize::THROUGH_REF.singularize}_id=#{@objeto.id}"
		end
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
		objeto.class.reflect_on_all_associations(:has_many).map { |a| objeto.send(a.name).any? }.include?(true)
	end
	def link_estado(objeto)
		"/#{objeto.class.downcase.pluralize}/estado?estado="
	end
end
