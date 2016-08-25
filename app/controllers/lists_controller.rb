class ListsController < ApplicationController
	before_action :find_list, except: [:index, :new, :create]
  def index
  	@lists = List.search(params[:search])
    if params[:search]
      if @lists == []
        @no_lists = "No lists matches this criteria. Please try again or browse all your lists below."
        @lists = current_user.lists
      else
        @no_lists = " "
        @lists = List.search(params[:search])
      end
    else
      @lists = current_user.lists
    end
  end

  def show
  end

  def new
  	@list = List.new
  end

  def create
  	@list = List.new(list_params)
  	@list.user_id = current_user.id
  	if @list.save
  		redirect_to list_path(@list)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @list.update
  		redirect_to lists_path
  	else
  		render :edit
  	end
  end

  def destroy
  		@list.destroy
	  	redirect_to lists_path
  end

  private

  def list_params
  	params.require(:list).permit(:name, :activity_type, :complete, :in_progress, :user_id)
  end

  def find_list
  	@list = List.find(params[:id])
  end

 
end
