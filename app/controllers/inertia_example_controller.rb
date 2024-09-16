class InertiaExampleController < ApplicationController
  def index
    render inertia: "InertiaExample", props: {
      name: params.fetch(:name, "Diego"),
      users: User.all
    }
  end
end
