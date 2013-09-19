class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception



	rescue_from CanCan::AccessDenied do |exception|
		set_flash exception.message, :error
		redirect_to "/"
	end


	private

		def set_flash( msg, code=:success, *objs )
			if flash[code].blank?
  				flash[code] = "<p>#{msg}</p>"
	  		else
	  			flash[code] += "<p>#{msg}</p>"
	  		end
	  		objs.each do |obj|
	  			obj.errors.each do |error|
		  			flash[code] += "<p>#{error.to_s}: #{obj.errors[error].join(';')}</p>"
				end
			end
		end


end
