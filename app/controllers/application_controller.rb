class ApplicationController < ActionController::Base
  def hello
    render html: 'Hello word!'
  end
end
