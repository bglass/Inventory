class ItemController < ActionController::Base

  def show
    @item = Item.new(root / params[:item])
  end

  def locations
    @item = Item.new(root)
  end

  def index
    @items = root.find.select{|n| n.directory?}.map{|d| Item.new d}
  end



  private

  def root
    (Pathname Rails.application.config.inventory_root).expand_path
  end

end
