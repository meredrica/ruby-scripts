#!/bin/ruby
require 'nokogiri'

files = {}
# put all files we got from the commandline into the files hash
ARGV.each do |file|
	f = File.open(file)
	files[file.to_sym] = Nokogiri::XML(f)
	f.close
	puts "comparing: #{file}"
end

common = []
# change the nokogiri objects to arrays
files.each do |k,v|
	files[k]= []
	v.xpath('//@name').each do |name|
		files[k] << name.value
		common << name.value
	end
	puts "#{k} has #{files[k].size} entries"
end

# find all common names
files.each do |k,v|
	common &= v
	common.uniq!
	p common.size
end

# remove common keys
files.each do |k,v|
	v-= common
	files[k] = v
end

# build the matrix
names={}
files.each do |filename,uniqvalues|
	uniqvalues.each do |v|
		defined = names[v]
		defined = [] if defined.nil?
		defined << filename
		names[v] = defined.uniq.sort
	end
end

# print out missing fields
puts '"key";"defined in"; "missing in"'
names.each do |k,v|	
	puts "\"#{k}\";\"#{v.sort.join(',')}\";\"#{(files.keys-v).sort.join(',')}\""
end
