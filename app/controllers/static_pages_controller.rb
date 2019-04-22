class StaticPagesController < ApplicationController
  def welcome
  end
  
  def home
    render json: {a: 1, b: 2}
  end
end
