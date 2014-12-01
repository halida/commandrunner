require 'sinatra'
require 'singleton'
require 'haml'

require 'json'

require 'open3'

class Runner
  include Singleton

  attr_accessor :cmd

  def init(cmd)
    self.cmd = cmd
    @stdin, @stdout, @stderr = Open3.popen3(self.cmd)
  end

  def eval(input)
    @stdin.puts(input)
    @stdout.gets
  end
end

Runner.instance.init(ENV['CMD'])

get '/' do
  haml :index
end

post '/run' do
  content_type :json
  cmd = params[:cmd]
  { cmd: cmd, result: Runner.instance.eval(cmd) }.to_json
end
