class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def create
    @registered_application = RegisteredApplication.new(application_params)
    @registered_applications = RegisteredApplication.all
    if @registered_application.save
      flash[:notice] = "You have sucessfully registered your application."
      redirect_to registered_applications_path
    else
      flash[:error] = "There was an error registering your application."
      redirect_to registered_applications
    end
  end

  def update
    @registered_application = RegisteredApplication.new

    if @registered_application.update_attributes(application_params)
      flash[:notice] = "You have sucessfully registered your application."
      redirect_to registered_applications
    else
      flash[:error] = "There was an error registering your application."
      redirect_to registered_applications
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "You have sucessfully deleted your application."
      redirect_to registered_applications
    else
      flash[:error] = "There was an error deleting your application."
      redirect_to registered_applications
    end
  end

  private

  def application_params
    params.require(:registered_application).permit(:name,:url)
  end
end
