# Generate the file.

class UsersController < ApplicationController
  before_action :authenticate_user!
end
