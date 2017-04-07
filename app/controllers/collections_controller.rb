class CollectionsController < ApplicationController
  protect_from_forgery

  def create
    Collections::Create.call(collection_params, current_user)
    redirect_to root_url
  end

  def destroy
    collection = Collection.find(params[:id])
    authorize(collection, :destroy?)
    Collections::Delete.call(collection, current_user)
    redirect_to root_url
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end
end
