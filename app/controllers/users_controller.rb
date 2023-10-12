# frozen_string_literal: true

# Generate the file.

class UsersController < ApplicationController
  before_action :authenticate_user!
end
