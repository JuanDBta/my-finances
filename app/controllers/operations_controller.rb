# Generate the file.

class OperationsController < ApplicationController
  before_action :authenticate_user!, except: [:splash]
  load_and_authorize_resource
  before_action :set_category
  before_action :set_operation, only: [:destroy]
  layout 'application'

  def new
    @operation = Operation.new
  end

  def index
    @category = Category.find(params[:category_id])
    @operations = @category.operations.order(created_at: :desc)
    @total_amount = @operations.sum(:amount)
  end

  def create
    @category = Category.find(params[:operation][:category_id])
    @operation = @category.operations.build(operation_params)
    @operation.user = current_user

    if @operation.save
      flash[:success] = 'Operation created!'
      redirect_to authenticated_root_path
    else
      flash.now[:error] = 'Error: Operation not saved'
      render :new
    end
  end

  def destroy
    authorize! :destroy, @operation

    if @operation.destroy
      flash[:success] = 'Operation deleted !!!'
    else
      flash[:error] = 'Unable to delete operation...'
    end

    redirect_to authenticated_root_path
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_operation
    @operation = Operation.find(params[:id])
  end
end
