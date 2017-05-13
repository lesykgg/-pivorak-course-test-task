class PersonsController < ApplicationController
  def profile
    unless user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'To view your profile you must be logged in.' }
      end
    end
  end
end
