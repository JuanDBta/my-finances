# frozen_string_literal: true

class CategoriesController < ApplicationController
  load_and_authorize_resource
  layout 'application'
  before_action :set_user

  def splash
    render layout: false
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created !!!'
      redirect_to root_path, notice: 'Category created successfully'
    else
      flash.now[:error] = 'Error: Category not saved'
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @transactions = @category.operations
  end

  def destroy
    @category = Category.find(params[:id])
    authorize! :destroy, @category
  
    ActiveRecord::Base.transaction do
      # Elimina todas las operaciones asociadas a la categoría
      @category.operations.destroy_all
  
      if @category.destroy
        flash[:success] = 'Category deleted !!!'
      else
        flash[:error] = 'Unable to delete category...'
        raise ActiveRecord::Rollback # Revertirá la transacción si ocurre un error
      end
    end
  
    redirect_to root_path
  end
  

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
