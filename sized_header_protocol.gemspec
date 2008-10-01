# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sized_header_protocol}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Tucker"]
  s.date = %q{2008-10-01}
  s.default_executable = %q{sized_header_protocol}
  s.description = %q{A simple chainable implementation of a basic sized header protocol. The  'protocol' does not define it's transport, that is left as configurable.  Implementing wire protocols should call send_data to construct packets or  frames and receive_data to deconstruct packets or frames.}
  s.email = %q{raggi@rubyforge.org}
  s.executables = ["sized_header_protocol"]
  s.extra_rdoc_files = ["History.txt", "README.txt", "bin/sized_header_protocol"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/sized_header_protocol", "lib/sized_header_protocol.rb", "spec/.bacon", "spec/helper.rb", "spec/runner", "spec/spec_sized_header_protocol.rb", "tasks/ann.rake", "tasks/autospec.rake", "tasks/bones.rake", "tasks/gem.rake", "tasks/git.rake", "tasks/manifest.rake", "tasks/notes.rake", "tasks/post_load.rake", "tasks/rdoc.rake", "tasks/rubyforge.rake", "tasks/setup.rb", "tasks/spec.rake", "tasks/svn.rake", "tasks/test.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/raggi/sized_header_protocol}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{sized_header_protocol}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{A simple chainable implementation of a basic sized header protocol}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
