class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV['USERNAME'], :password => ENV['PASSWORD']
  def show
    @products = Product.all
    @categories = Category.all
    puts @categories.inspect
  end
end
