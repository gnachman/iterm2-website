require 'rubygems'
require 'yaml'
require 'rack/jekyll'

use Rack::ShowExceptions
use Rack::Lint

map '/images' do
  run Rack::Directory.new(File.expand_path('../_site/images', __FILE__))
end

map '/' do
  run Rack::Jekyll.new
end
