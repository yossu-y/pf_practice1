class User::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def show
  end

  def index
  end
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def article_params
  end

  private

  def ensure_correct_user
  end
  
end
