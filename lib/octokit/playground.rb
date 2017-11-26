require "./playground/version"
require "Octokit"
require 'yaml'

module Octokit
  module Playground
  	credentials = YAML.load_file(File.join(__dir__, '../../credentials.yaml'))

    Octokit.configure do |c|
	  c.login = credentials['login']
	  c.password = credentials['password']
	end

	# Fetch the current user
	puts Octokit.repos({}, query: {type: 'owner', sort: 'asc'})
  end
end
