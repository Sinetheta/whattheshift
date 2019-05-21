class ScenariosController < ApplicationController
  before_action :load_project
  before_action :load_scenario, only: [:destroy, :edit, :run, :show, :update]

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

  def run
    require 'whattheshift/scripting/revision_from_scenario'
    runner = WhatTheShift::Scripting::RevisionFromScenario.new(capybara_driver, @scenario)
    revision = runner.call(run_params[:description])
    flash[:notice] = "Revision created!"
    redirect_to revision_path(revision)
  end

  private

  def capybara_driver
    require 'whattheshift/scripting/capybara_driver'
    WhatTheShift::Scripting::CapybaraDriver.new
  end

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
                        :is_full_height,
                        :url
                      ]
                    }
                  ]
  end

  def run_params
    params.permit(:description)
  end
end
