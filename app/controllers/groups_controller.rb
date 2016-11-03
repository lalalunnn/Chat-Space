class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(create_params)
    if @group.save
       redirect_to root_path, notice: 'グループの作成に成功しました。'
     else
       redirect_to new_group_path ,alert: 'グループの作成に失敗しました。'
     end
  end


    private
    def create_params
      params.require(:group).permit(:group_name,{user_ids: []})
    end
end
