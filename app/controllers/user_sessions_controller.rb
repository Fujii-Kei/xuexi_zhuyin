class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to categories_path, notice: (t ".success")
    else
      flash.now[:alert] = (t ".failure")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: (t ".success"), status: :see_other)
  end
end