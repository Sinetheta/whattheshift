class WelcomeController < ApplicationController
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
