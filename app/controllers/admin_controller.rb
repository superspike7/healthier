class AdminController < ApplicationController
  layout 'admin'
  layout -> { false if turbo_frame_request? }
  # add logic here for admin role access only restriction 
end
