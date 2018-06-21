# frozen_string_literal: true

# Reponse
module Response
  # render resources
  def json_resources(object, status = :ok)
    render json: { data: object }, status: status
  end

  # render one object element
  def json_resource(object, status = :ok)
    render json: object, status: status
  end
end
