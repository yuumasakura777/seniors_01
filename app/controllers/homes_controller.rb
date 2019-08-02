class HomesController < ApplicationController

  skip_before_action :logged_in_user

  def home
  end

  def use
  end
end
