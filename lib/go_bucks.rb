require "go_bucks/version"
require "go_bucks/engine"

module GoBucks
  Error = Class.new(StandardError)
  InvalidAmount = Class.new(Error)
end
