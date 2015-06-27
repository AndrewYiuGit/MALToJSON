class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :null_session

    private
    def render_404(exception = nil)
        if exception
            logger.info "Rendering 404: #{exception.message}"
        end

        response = {
            :statusCode => 404,
            :errorMessage => "Page not found"
        }

        respond_to do |format|
            format.html { render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false }
            format.json { render :json => response.to_json, :status => 404 }
        end
    end
end
