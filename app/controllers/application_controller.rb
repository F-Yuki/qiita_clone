class ApplicationController < ActionController::Bas
  include DeviseTokenAuth::Concerns::SetUserByToken
end
