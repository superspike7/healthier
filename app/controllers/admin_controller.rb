class AdminController < ApplicationController
  layout 'admin'
  layout -> { false if turbo_frame_request? }
  before_action :authorize_admin
end
