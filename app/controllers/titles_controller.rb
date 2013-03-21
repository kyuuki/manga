# -*- coding: utf-8 -*-
class TitlesController < ApplicationController
  # GET /titles
  # GET /titles.json
  def index
    @query = params[:query]   # 検索ページの場合は nil 以外
    @query = nil if @query == ""  # 何も入力しないで、検索ボタンを押された場合だけは弾く

    if (@query.nil?)
      @titles = Title.order("author", "title").paginate(:page => params[:page], :per_page => 20)
    else
      @titles = Title.where("author LIKE :query OR title LIKE :query", { :query => "%#{@query}%" })
                     .order("author", "title").paginate(:page => params[:page], :per_page => 20)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @titles }
    end
  end

  # GET /titles/1
  # GET /titles/1.json
  def show
    @title = Title.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @title }
    end
  end

  # GET /titles/new
  # GET /titles/new.json
  def new
    @title = Title.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @title }
    end
  end

  # GET /titles/1/edit
  def edit
    @title = Title.find(params[:id])
  end

  # POST /titles
  # POST /titles.json
  def create
    @title = Title.new(params[:title])

    respond_to do |format|
      if @title.save
        format.html { redirect_to @title, notice: 'Title was successfully created.' }
        format.json { render json: @title, status: :created, location: @title }
      else
        format.html { render action: "new" }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /titles/1
  # PUT /titles/1.json
  def update
    @title = Title.find(params[:id])

    respond_to do |format|
      if @title.update_attributes(params[:title])
        format.html { redirect_to @title, notice: 'Title was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titles/1
  # DELETE /titles/1.json
  def destroy
    @title = Title.find(params[:id])
    @title.destroy

    respond_to do |format|
      format.html { redirect_to titles_url }
      format.json { head :no_content }
    end
  end
end
