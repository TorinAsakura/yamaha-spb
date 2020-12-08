class Admin::ItemTtxesController < ApplicationController
def destroy
  @item_ttx = ItemTtx.find(params[:id])
  @id = @item_ttx.id
  @item_ttx.destroy
  render :update do |page|
    page.replace_html 'item_ttx_'+@id.to_s, ''
  end
end
end
