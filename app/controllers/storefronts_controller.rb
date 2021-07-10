class StorefrontsController < ApplicationController
  skip_before_action :verified_user, only: [:index]
  
  def index 
  end
end
