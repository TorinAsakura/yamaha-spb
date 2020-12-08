class Admin::TtxGroupsController < ApplicationController
  def create
    @ttx_group = TtxGroup.new(params[:ttx_group])
    if @ttx_group.save
      render :update do |page|
        page.insert_html :before, "tr_for_ttx_group_form", :partial => "admin/items/ttx_group", :object => @ttx_group
      end
    else 
      render :text => "Произошла ошибка при добавлении группы"
    end
  end
  
  def destroy
    @ttx_group = TtxGroup.find(params[:id])
    @id = @ttx_group.id
    @ttx_group.destroy
    render :update do |page|
      page.replace_html 'ttx_group_div_'+@id.to_s, ''
    end
  end
end
