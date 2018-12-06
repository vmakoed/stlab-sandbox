# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.persisted?
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to action: :index
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                  :last_name, :email, :age)
  end
end
