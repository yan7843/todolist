class ListsController < ApplicationController
  before_action :set_list, :only => [:show, :edit, :update, :destroy, :is_public] 
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save

    redirect_to lists_url
  end

  def show
  end

  def edit
  end

  def update
    @list.update_attributes(list_params)

    redirect_to list_path(@list)
  end

  def destroy
    if Time.new.to_date < @list.date
      @list.destroy
      redirect_to lists_url
    else
      redirect_to lists_path
    end
  end

  def is_public
    @list.update(is_public: !(@list.is_public))
  end

  

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :date, :note)
  end
end
