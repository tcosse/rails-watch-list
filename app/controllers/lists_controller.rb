class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def new
    @list = List.new
  end

  def create
    @new_list_item = List.new(list_params)
    if @new_list_item.save
      redirect_to list_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @lists = List.all
  end

  def show

  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
