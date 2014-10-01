class SessionsController < ApplicationController
  def new
    if session[:manager_id]
      redirect_to beacons_path
    end
  end

  def create
    @manager = Manager.find_by(name: params[:name])
    if @manager
      if @manager.authenticate(params[:password])
        session[:manager_id] = @manager.id
        redirect_back_or beacons_path
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:manager_id] = nil
    redirect_to root_path
  end

  private

    def redirect_back_or(default)
      redirect_to(session[:return_to] || default)
      session.delete(:return_to)
    end

end
