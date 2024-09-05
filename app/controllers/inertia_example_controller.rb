class InertiaExampleController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]
  def index
    render inertia: "InertiaExample", props: {
      name: params.fetch(:name, "Diego")
    }
  end
end
