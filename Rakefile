# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'sized_header_protocol'

task :default => 'spec:run'

PROJ.name = 'sized_header_protocol'
PROJ.authors = 'James Tucker'
PROJ.email = 'raggi@rubyforge.org'
PROJ.url = 'http://github.com/raggi/sized_header_protocol'
PROJ.rubyforge.name = 'sized_header_protocol'
PROJ.version = SizedHeaderProtocol.version

PROJ.exclude = %w(tmp$ bak$ ~$ CVS \.git \.hg \.svn ^pkg ^doc \.DS_Store
  \.cvs \.svn \.hgignore \.gitignore \.dotest \.swp$ ~$)

namespace :gem do
  task :spec do
    open(PROJ.name + '.gemspec', 'w') { |f| f << PROJ.gem._spec.to_ruby }
  end
end