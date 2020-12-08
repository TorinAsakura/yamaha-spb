class Admin::TtxesController < ApplicationController
  def create
    @ttx = Ttx.new(params[:ttx])

    if @ttx.save
      #render :text => request.content_type #header('Content-Type: text/html; charset=utf-8');
      render :update do |page|
        #i = 1000+rand(1000)
        ttx = @ttx
        page.insert_html :before, "tr_group_id_#{@ttx.ttx_group_id}", "<div id='ttx_div_#{ttx.id}'>
        	<p>" + ttx.title + link_to_remote("Удалить", :url => admin_ttx_path(ttx), :method => :delete, 
        	:confirm => "Вы уверены что хотите удалить группу характеристик? Характеристика будет удалена со всех типов техники.") + "</p>
        	<p>"+text_field_tag("item[item_ttxes_attributes][][value]")+
        	hidden_field_tag("item[item_ttxes_attributes][][ttx_id]", ttx.id) +
        "</p>
        </div>"
        page.select('#ttx_title_'+@ttx.ttx_group_id.to_s).val('')
        
        #'<tr><td>'+@ttx.title+'<td>
        #					  <input type="text" size="30" name="item[item_ttxes_attributes][][value]" id="item_item_ttxes_attributes_'+i.to_s+'_value"/>
        #					  <input type="hidden" value="'+@ttx.id.to_s+'" name="item[item_ttxes_attributes][][ttx_id]" id="item_item_ttxes_attributes_'+i.to_s+'_ttx_id"/>
        #				</td></tr>'
      end
    else 
      render :update do |page|  
      #  @ttx.errors.each do |error|
       #   @errors += error.to_s
       # end
        page.alert('Ошибка при создании характеристики')
      end
    end
  end
  
  def destroy
    @ttx = Ttx.find(params[:id])
    @id = @ttx.id
    @ttx.destroy
    render :update do |page|
      page.replace_html 'ttx_div_'+@id.to_s, ''
    end
  end
end
