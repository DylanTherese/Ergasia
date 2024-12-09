class WorkspacesController < ApplicationController
  def index
    @workspaces = Workspace.all
    @new_workspace = Workspace.new

    if search_params.present?
      @workspaces = Workspace.where("name LIKE ?", "%#{search_params[:query]}%")
    else
      workspaces = Workspace.all
    end

    render :index, locals: {workspaces: @workspaces, new_workspace: @new_workspace }
  end

  def show
    @workspace = Workspace.find(workspace_id)
    @user = User.find(@workspace.user_id)
  end

  def new
    @workspace = Workspace.new

    render :new, locals: { workspace: @workspace }
  end

  def create
    @workspace = Workspace.new(workspace_params)
    if @workspace.save
      flash[:success] = "Workspace successfully created"
      redirect_to workspace_path(@workspace)
    else
      flash[:error] = "Something went wrong"
      render 'new', locals: {workspace: @workspace}
    end
  end

  def edit
    @workspace = Workspace.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:id])
    @workspace.update(workspace_params)

    if @workspace.save
      flash[:success] = "Workspace successfully updated"
      redirect_to workspace_path(@workspace)
    else
      flash[:error] = "Something went wrong"
      render 'edit', locals: {workspace: @workspace}
    end
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    @workspace.destroy

    redirect_to workspace_path, status: :see_other
  end



  private
  def workspace_id
    params[:id]
  end

  def search_params
    return false unless params.key?(:search)
    params.require(:search).permit(:query)
  end

  def workspace_params
    params.require(:workspace).permit(%i[title latitude longitude contact price_per_day check_in_time check_out_time check_in_date check_out_date
                                          description max_guests bedrooms office bath pet_allowed wifi_speed user_id])
  end
end
