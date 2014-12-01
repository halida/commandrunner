require 'sinatra'
require 'singleton'
require 'haml'

require 'json'


class Runner
  include Singleton

  attr_accessor :cmd

  def eval(input)
    "input: #{input}"
  end
end

Runner.instance.cmd = ENV['cmd']

get '/' do
  haml :index
end

post '/run' do
  content_type :json
  cmd = params[:cmd]
  { cmd: cmd, result: Runner.instance.eval(cmd) }.to_json
end
