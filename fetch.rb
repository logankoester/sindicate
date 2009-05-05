# I suggest executing this file every 10 minutes

require 'open-uri'
require 'rubygems'
require 'json'
require 'twitter'

#################################################
#                     DEMO                      #
#################################################

# Search Twitter for conversations tagged #sindicate
@twitter = Twitter::Search.new('sindicate')
@twitter.fetch

# Get a list of contributers from GitHub
@contributers = Array.new
commits = JSON.parse( open('http://github.com/logankoester/sindicate/network_data_chunk').read )
commits.first[1].each do |c|
	contributer = {
		'name' => c['author'],
		'github' => c['login'],
		'gravatar' => c['gravatar']
	}
	@contributers.push contributer
end
@contributers.uniq!

File.open('demo.yml', 'w') { |f|
	f.write(
		{ 'twitter' => @twitter.first.to_hash, 'contributers' => @contributers }.to_yaml.to_s
	)
}
