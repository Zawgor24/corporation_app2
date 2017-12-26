# frozen_string_literal: true

class WorkshopsController < ApplicationController
  def index
    @workshops = Factory.find(params[:factory_id]).workshops.all
  end
end
