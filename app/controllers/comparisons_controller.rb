class ComparisonsController < ApplicationController
  def index
    @comparisons = Comparison.includes(:image_diffs).all
  end

  def show
    @comparison = Comparison.includes(:image_diffs).find(params[:id])
  end
end
