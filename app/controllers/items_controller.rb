# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Corporation.find(params[:corporation_id]).items
  end
end
