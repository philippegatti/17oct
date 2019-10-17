$:.unshift File.expand_path("./../lib", __FILE__)

require 'bundler'
Bundler.require

require 'Player'
require 'Boardcase'
require 'Board'
require 'Application'
require 'Game'
require 'view/show'

partie=Application.new #lancement d'une partie

