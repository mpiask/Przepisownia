# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 7)
  end
end
