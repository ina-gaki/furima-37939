class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:index ,:new ,:create]

  def index
  end

  def new
  end

  def create
  end
end
