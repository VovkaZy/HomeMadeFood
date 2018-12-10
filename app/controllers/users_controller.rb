# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    # let(:show) { User.find params[:id] }
    @user = User.find_by params[:id]
  end
end
