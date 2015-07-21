class NumbersController < ApplicationController

  def new
    @contacts = Contact.all
    @number = Number.new
  end

  def create

  end

end
