class ScenariosController < ApplicationController
  before_action :load_project
  before_action :load_scenario, only: [:destroy, :edit, :show, :update]

  def create
    @scenario = @project.scenarios.create(scenario_params)
    render :show
  end

  def destroy
    @scenario.destroy
    flash[:notice] = "Scenario deleted!"
    redirect_to project_scenarios_path(@project)
  end

  def index
    @scenarios = @project.scenarios
  end

  def new
    @scenario = @project.scenarios.new
    @scenario.script = NavigationScript.new
  end

  def update
    @scenario.update(scenario_params)
    render :show
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def load_scenario
    @scenario = Scenario.includes(:script).find(params[:id])
  end

  def scenario_params
    params.require(:scenario)
          .permit :name,
                  script_attributes: [
                    :type,
                    {
                      destinations_attributes: [
                        :description,
                        :url
                      ]
                    }
                  ]
  end
end
