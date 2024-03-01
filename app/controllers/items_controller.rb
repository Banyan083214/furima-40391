class ItemsController < ApplicationController
  def index
    Rails.logger.debug("ItemsController#index called.")
    @items = Item.all
  end
end