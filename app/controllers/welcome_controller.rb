# -*- coding: utf-8 -*-
class WelcomeController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @titles }
    end
  end
end
