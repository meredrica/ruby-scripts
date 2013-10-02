#!/bin/ruby
require 'fileutils'

dirs = %w{ldpi mdpi hdpi xhdpi xxhdpi}

what = ARGV[0]
from = ARGV[1]
to = ARGV[2]

if what.nil? || from.nil? || to.nil?
	puts "need exactly 3 arguments: what, from, to"
	exit
end

dirs.each do |dir|
	target = File.join(from,dir,what)
	next unless File.exist? target
	dest = File.join(to,"drawable-#{dir}")
	Dir.mkdir dest unless Dir.exist? dest
	puts "copy #{target} to #{dest}"
	FileUtils.cp(target,dest)
end
