class UserController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      # データベース操作
    end
end
