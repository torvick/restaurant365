class Api::V1::AuthenticationsController < Api::V1::BaseControllera

  def create
    response = BuildAuthenticate.build!(params)
    render json: response
  end
end
