class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @list = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id:  @list.id)
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice: "#{@list.name} created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    name = List.find(params[:id]).name
    List.destroy(params[:id])
    redirect_to root_path, alert: "#{name} destroyed"
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
