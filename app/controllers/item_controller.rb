class ItemController < ActionController::Base

  def show
    root = (Pathname Rails.application.config.inventory_root).expand_path
    @item = Item.new(root / params[:item])
  end

  def locations
    root = (Pathname Rails.application.config.inventory_root).expand_path
    @item = Item.new(root)
  end



end
