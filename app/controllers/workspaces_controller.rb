class WorkspacesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /workspaces
  # GET /workspaces.json
  def index
    @workspaces = current_user.workspaces

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @workspaces }
    end
  end

  # GET /workspaces/1
  # GET /workspaces/1.json
  def show
    @ticket = Ticket.new(:workspace_id => @workspace.id)
    respond_to do |format|
      format.html # show.html.erb
      # format.json { render json: @workspace }
    end
  end

  # GET /workspaces/new
  # GET /workspaces/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      # format.json { render json: @workspace }
    end
  end

  # GET /workspaces/1/edit
  def edit
    @membership = Membership.new(:workspace_id => @workspace.id)
  end

  # POST /workspaces
  # POST /workspaces.json
  def create
    respond_to do |format|
      if @workspace.save
        current_user.add_to_owned_workspaces(@workspace)
        format.html { redirect_to workspaces_path, notice: "Workspace #{@workspace.name} was successfully created" }
        # format.json { render json: @workspace, status: :created, location: @workspace }
      else
        format.html { render action: "new" }
        # format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workspaces/1
  # PUT /workspaces/1.json
  def update
    respond_to do |format|
      if @workspace.update_attributes(params[:workspace])
        format.html { redirect_to @workspace, notice: 'Group was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        # format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workspaces/1
  # DELETE /workspaces/1.json
  def destroy
    @workspace.destroy

    respond_to do |format|
      format.html { redirect_to workspaces_url }
      # format.json { head :no_content }
    end
  end
end
