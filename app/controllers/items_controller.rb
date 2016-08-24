class ItemsController < ApplicationController
	before_action :find_list
	def index
		@items = @list.items
	end
  def show
  	@item = @list.items.find(params[:id])
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = @list.items.new(item_params)
  	if @item.save
  		redirect_to list_item_path(@list, @item)
  	else
  		render :new
  	end
  end

  def edit
  	@item = @list.items.find(params[:id])
  end

  def update
  	@item = @list.items.find(params[:id])
  	if @item.update(item_params)
  		redirect_to list_item_path(@list, @item)
  	else
  		render :edit
  	end
  end

  def destroy
  	@item = @list.items.find(params[:id])
  	@item.destroy
  	redirect_to list_items_path(@list)
  end

  private

  def item_params
  	params.require(:item).permit(:item_name, :description, :complete, :in_progress, :like, :image)
  end

  def find_list
  	@list = List.find(params[:list_id])
  end
end
