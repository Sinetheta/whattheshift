class ComparisonsController < ApplicationController
  def create
    require 'whattheshift/revision_compare'
    @comparison = WhatTheShift::RevisionCompare.new.call(*revisions)
    render :show
  end

  def index
    @comparisons = policy_scope(Comparison).includes(:image_diffs).all
  end

  def show
    @comparison = Comparison.includes(:image_diffs).find(params[:id])
    authorize @comparison
  end

  private

  def comparision_params
    params.require(:comparison)
          .permit(revision_ids: [])
  end

  def revisions
    revision_ids = comparision_params[:revision_ids]
    raise 'Must select 2 Revisions' unless revision_ids.length == 2
    Revision.where(id: comparision_params[:revision_ids])
  end
end
