class DataController < ApplicationController
  def index
    @users = User.order(:id)
    respond_to do |format|
      format.html
      format.xlsx
    end
  end
end