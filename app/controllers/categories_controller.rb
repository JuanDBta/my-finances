# Generate the file.

class CategoriesController < ApplicationController
  load_and_authorize_resource
  layout 'application'
  before_action :set_user
  before_action :set_category, only: %i[show destroy]

  def splash
    render layout: false
  end

  def index
    @categories = Category.all
    @category = Category.find_by(id: params[:category_id])
  end

  def new
    @current_user = current_user
    @categories = Category.new
  end

  def create
    @categories = current_user.categories.new(category_params)
    if @categories.save
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
      @category.operations.destroy_all

      if @category.destroy
        flash[:success] = 'Category deleted !!!'
      else
        flash[:error] = 'Unable to delete category...'
        raise ActiveRecord::Rollback
      end
    end

    redirect_to authenticated_root_url
  end

  def set_category
    @category = Category.find(params[:id])
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id]) || current_user
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
