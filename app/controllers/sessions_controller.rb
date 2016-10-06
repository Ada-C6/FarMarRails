class SessionsController < ApplicationController
  def index

  end

  def new
    if params[:user_type] == 'user'
      user = {type: params[:user_type], id: nil}
      log_in (user)
      puts current_user.id
      redirect_to users_index_path
    end

    @type = params[:user_type]
  end

  def create

    user = {type: params[:user_type], id: params[:session][:id]}
    log_in (user)
    if params[:user_type].downcase == "market"
      redirect_to markets_index_path
    elsif params[:user_type].downcase == "vendor"
      redirect_to vendors_index_path
    else
      redirect_to users_index_path
    end

  end

  def destroy
  end
end
