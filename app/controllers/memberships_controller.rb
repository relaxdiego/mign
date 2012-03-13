class MembershipsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def create
    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership.group, notice: 'Membership was successfully created.' }
        format.json { render json: @membership, status: :created, location: @membership }
      else
        format.html { redirect_to @membership.group }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

end
