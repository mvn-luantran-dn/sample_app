# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by(params[:id])
    redirect_to '/404' unless @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_comfirm)
  end
end
