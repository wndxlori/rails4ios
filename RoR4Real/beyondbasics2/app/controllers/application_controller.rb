class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :log_custom
  
  def log_custom
    CUSTOM_LOGGER.info( "Handled request from: #{request.remote_ip}" )
  end
end
