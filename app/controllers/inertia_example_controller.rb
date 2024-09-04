class InertiaExampleController < ApplicationController
  def index
    render inertia: "InertiaExample", props: {
      name: params.fetch(:name, "Diego")
    }
  end
end
