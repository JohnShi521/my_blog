class ApplicationController < ActionController::Base

  def real_ip(request)
    request.env['HTTP_X_FORWARDED_FOR'].present? ? request.env['HTTP_X_FORWARDED_FOR'] : request.remote_ip
  end
end
