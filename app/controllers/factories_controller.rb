# frozen_string_literal: true

class FactoriesController < ApplicationController
  def index
    @factories = Corporation.find(params[:corporation_id]).factories
  end
end
