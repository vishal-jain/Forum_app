class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if request.xhr?
      render :text => exception.message, :status => 401
      return
    else
      respond_to do |format|
        format.html { redirect_to root_path(), :alert => exception.message }
        format.json { render :status => 401,
                             :json => { :success => false,
                                        :error => exception.message
                                      }}
      end

    end
  end

end
