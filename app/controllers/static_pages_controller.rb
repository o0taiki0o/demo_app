class StaticPagesController < ApplicationController
  def home
  end

  def shopping
    if !signed_in?
      flash.now[:error] = 'You must login before shopping'
      render 'sessions/new'
    end
    @categories = Category.all
    @products = Product.all
  end

  def about
  end

  def contact
  end
end
