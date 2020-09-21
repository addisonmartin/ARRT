require 'ARRT/version'

module ARRT
  require_relative 'ARRT/geometry'
  require_relative 'ARRT/image'
  require_relative 'ARRT/camera'

  class Error < StandardError; end
end
