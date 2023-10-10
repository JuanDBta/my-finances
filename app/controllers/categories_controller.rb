class CategoriesController < ApplicationController

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
        redirect_to root_path, notice: 'Category created successfully'
      else
        render :new
      end
    end
  
    def show
      @category = Category.find(params[:id])
      @transactions = @category.operations
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name, :icon)
    end
  end
  