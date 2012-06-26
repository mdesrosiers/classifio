class ClassifiedsController < ApplicationController
  respond_to :json

  def index
    respond_with Classified.all
  end

  def show
    respond_with Classified.find(params[:id])
  end

  def create
    respond_with Classified.create(params[:classified])
  end

  def update
    respond_with Classified.update(params[:id], params[:classified])
  end

  def destroy
    respond_with Classified.destroy(params[:id])
  end
end
