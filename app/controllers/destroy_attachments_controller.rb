class DestroyAttachmentsController < ApplicationController
  before_action :authorize_user

  def destroy
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge
    redirect_back fallback_location: root_path, notice: "Deleted"
  end
end
