class WelcomeController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    @comparisons = Comparison.includes(
        image_diffs: [:after_image, :before_image],
        from_revision: [:images],
        scenario: [:project],
        to_revision: [:images]
      )
      .order(created_at: :desc)
      .limit(5)
  end
end
