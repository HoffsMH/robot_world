require 'bundler'
Bundler.require

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) ))

require 'app/controllers/robot_world_app'

run RobotWorldApp
