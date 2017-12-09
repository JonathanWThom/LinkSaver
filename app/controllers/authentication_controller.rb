class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :api_authenticate

  def api_authenticate
    auth_token =
      AuthenticateUser.new(params[:email], params[:password]).call
    json_response(auth_token: auth_token)
  end

    ## $.ajax({
  #   dataType: "json",
  #   url: "http://localhost:3000/auth/login",
  #   method: "POST",
  #   data: {email: "email", password: "password"}
  # }).done(function(data) {console.log(data)});
# => receive auth token or error

# function tokenSuccess(err, response) {
#   if(err){
#       throw err;
#   }
#   $window.sessionStorage.accessToken = response.body.access_token;
# }

# https://stormpath.com/blog/where-to-store-your-jwts-cookies-vs-html5-web-storage
# https://stackoverflow.com/questions/21978658/invalidating-json-web-tokens

  private

  def auth_params
    params.permit(:email, :password)
  end
end
