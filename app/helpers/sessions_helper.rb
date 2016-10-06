module SessionsHelper

  class User

    def initialize

    end

    def id
      return nil
    end

  end

  def log_in(user)
    session[:user_type] = user[:type].downcase
    session[:user_id] = user[:id].to_i
  end

  def current_user
    if session[:user_type] == "vendor"
      @current = Vendor.find(session[:user_id])
    elsif session[:user_type] == "market"
      @current = Market.find(session[:user_id])
    else
      @current = User.new
    end

    return @current

  end

end
