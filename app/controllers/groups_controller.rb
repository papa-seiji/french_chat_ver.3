class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:users).order("created_at DESC")
  end
  
  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  def show
    @group = Group.find(params[:id])
    @group = group_messages_path([:group_id])
    # @group = @group.messages
    
    
    
  end

  def destroy
    # group = Group.find(params[:id])
    # group = destroy
    # redirest_to root_path

    @group = Group.find(params[:id])
    @group = destroy(group_params[:id])
    redirect_to @group, notice: 'グループを削除しました'
    
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end