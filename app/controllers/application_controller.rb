class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    render file: "public/401.html", status: :unauthorized, layout: false
    # respond_to do |format|
    #   format.json { head :forbidden }
    #   format.html { redirect_to main_app.root_url, :alert => exception.message }
    # end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
