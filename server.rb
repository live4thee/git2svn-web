require 'rubygems'
require 'sinatra'
require 'erb'
require 'json'

# Listening on 0.0.0.0:8080
# $ ruby server.rb -p 8080 -o 0.0.0.0
#
#set :bind, '0.0.0.0'
#set :port, 8080

# Handle GET-request (Show the upload form)
get "/" do
  erb :index
end

# Handle POST-request (Receive and save the uploaded file)
post "/" do
  basename = File.basename(params['myfile'][:filename], '.*')
  filename = basename + '-' + Time.new.to_i.to_s + '.diff'

  srcpath = 'public/uploads/' + filename
  dstpath = 'public/downloads/' + filename

  File.open(srcpath, "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end

  # TODO: popen3 to capture stderr
  is_success = system("./git2svn.sh #{srcpath} #{dstpath}")
  {:is_success => is_success, :link => is_success ? 'downloads/' + filename : ''}.to_json
end
