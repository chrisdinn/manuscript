# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{manuscript}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["hotink"]
  s.date = %q{2010-01-22}
  s.description = %q{A gem for publishing a small Hot Ink authenticated site}
  s.email = %q{chris@hotink.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "config.ru",
     "db/migrate/001_create_pages.rb",
     "db/migrate/002_create_templates.rb",
     "db/migrate/003_add_template_id_to_pages.rb",
     "db/migrate/004_add_layouts_to_templates.rb",
     "db/migrate/005_create_template_files.rb",
     "db/migrate/006_add_parent_to_pages.rb",
     "lib/manuscript.rb",
     "lib/manuscript/base.rb",
     "lib/manuscript/keymaster.rb",
     "lib/manuscript/layout_template.rb",
     "lib/manuscript/page.rb",
     "lib/manuscript/page_manager.rb",
     "lib/manuscript/page_template.rb",
     "lib/manuscript/template.rb",
     "lib/manuscript/template_file.rb",
     "lib/manuscript/template_file_manager.rb",
     "lib/manuscript/template_manager.rb",
     "lib/manuscript/user.rb",
     "manuscript.gemspec",
     "public/css/base.css",
     "spec/manuscript/base_spec.rb",
     "spec/manuscript/layout_template_spec.rb",
     "spec/manuscript/page_manager_spec.rb",
     "spec/manuscript/page_spec.rb",
     "spec/manuscript/page_template_spec.rb",
     "spec/manuscript/template_file_manager_spec.rb",
     "spec/manuscript/template_file_spec.rb",
     "spec/manuscript/template_manager_spec.rb",
     "spec/manuscript/user_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "views/_page.haml",
     "views/edit_template_file.haml",
     "views/layout.haml",
     "views/menu.haml",
     "views/new_template_file.haml",
     "views/page.haml",
     "views/pages.haml",
     "views/template.haml",
     "views/template_files.haml",
     "views/templates.haml"
  ]
  s.homepage = %q{http://github.com/hotink/manuscript}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A gem for publishing a small Hot Ink authenticated site}
  s.test_files = [
    "spec/manuscript/base_spec.rb",
     "spec/manuscript/layout_template_spec.rb",
     "spec/manuscript/page_manager_spec.rb",
     "spec/manuscript/page_spec.rb",
     "spec/manuscript/page_template_spec.rb",
     "spec/manuscript/template_file_manager_spec.rb",
     "spec/manuscript/template_file_spec.rb",
     "spec/manuscript/template_manager_spec.rb",
     "spec/manuscript/user_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 2.3.5"])
      s.add_runtime_dependency(%q<rdiscount>, [">= 1.3.5"])
      s.add_runtime_dependency(%q<sinatra>, [">= 0.9.4"])
      s.add_runtime_dependency(%q<haml>, [">= 2.2.12"])
      s.add_runtime_dependency(%q<gatekeeper>, [">= 0.1.1"])
      s.add_runtime_dependency(%q<liquid>, [">= 2.0.0"])
      s.add_runtime_dependency(%q<paperclip>, [">= 2.3.1.1"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<activerecord>, [">= 2.3.5"])
      s.add_dependency(%q<rdiscount>, [">= 1.3.5"])
      s.add_dependency(%q<sinatra>, [">= 0.9.4"])
      s.add_dependency(%q<haml>, [">= 2.2.12"])
      s.add_dependency(%q<gatekeeper>, [">= 0.1.1"])
      s.add_dependency(%q<liquid>, [">= 2.0.0"])
      s.add_dependency(%q<paperclip>, [">= 2.3.1.1"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2.3.5"])
    s.add_dependency(%q<rdiscount>, [">= 1.3.5"])
    s.add_dependency(%q<sinatra>, [">= 0.9.4"])
    s.add_dependency(%q<haml>, [">= 2.2.12"])
    s.add_dependency(%q<gatekeeper>, [">= 0.1.1"])
    s.add_dependency(%q<liquid>, [">= 2.0.0"])
    s.add_dependency(%q<paperclip>, [">= 2.3.1.1"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

