class PagesController < ApplicationController
  def index
    @pages = Page.find(:all)
  end
  
  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    @page.save!
    redirect_to page_path(@page)
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.attributes = params[:page]
    @page.save!
    redirect_to page_path(@page)
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
  end
end
