Gem::Specification.new do |s|
  s.name = %q{webby}
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Pease"]
  s.date = %q{2008-08-07}
  s.default_executable = %q{webby}
  s.description = %q{*Webby* is a fantastic little website management system. It would be called a _content management system_ if it were a bigger kid. But, it's just a runt with a special knack for transforming text. And that's really all it does - manages the legwork of turning text into something else, an *ASCII Alchemist* if you will.}
  s.email = %q{tim.pease@gmail.com}
  s.executables = ["webby"]
  s.extra_rdoc_files = ["History.txt", "README.txt", "bin/webby", "lib/webby/tasks/build.rake", "lib/webby/tasks/create.rake", "lib/webby/tasks/deploy.rake", "lib/webby/tasks/growl.rake", "lib/webby/tasks/heel.rake", "lib/webby/tasks/validate.rake"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/webby", "examples/blog/Sitefile", "examples/blog/tasks/blog.rake", "examples/blog/templates/atom_feed.erb", "examples/blog/templates/blog/month.erb", "examples/blog/templates/blog/post.erb", "examples/blog/templates/blog/year.erb", "examples/presentation/Sitefile", "examples/presentation/content/css/uv/twilight.css", "examples/presentation/content/presentation/_sample_code.txt", "examples/presentation/content/presentation/index.txt", "examples/presentation/content/presentation/s5/blank.gif", "examples/presentation/content/presentation/s5/bodybg.gif", "examples/presentation/content/presentation/s5/framing.css", "examples/presentation/content/presentation/s5/iepngfix.htc", "examples/presentation/content/presentation/s5/opera.css", "examples/presentation/content/presentation/s5/outline.css", "examples/presentation/content/presentation/s5/pretty.css", "examples/presentation/content/presentation/s5/print.css", "examples/presentation/content/presentation/s5/s5-core.css", "examples/presentation/content/presentation/s5/slides.css", "examples/presentation/content/presentation/s5/slides.js", "examples/presentation/layouts/presentation.txt", "examples/presentation/templates/_code_partial.erb", "examples/presentation/templates/presentation.erb", "examples/tumblog/Sitefile", "examples/tumblog/content/css/tumblog.css", "examples/tumblog/content/images/tumblog/permalink.gif", "examples/tumblog/content/images/tumblog/rss.gif", "examples/tumblog/content/tumblog/200806/the-noble-chicken/index.txt", "examples/tumblog/content/tumblog/200807/historical-perspectives-on-the-classic-chicken-joke/index.txt", "examples/tumblog/content/tumblog/200807/mad-city-chickens/index.txt", "examples/tumblog/content/tumblog/200807/the-wisdom-of-the-dutch/index.txt", "examples/tumblog/content/tumblog/200807/up-a-tree/index.txt", "examples/tumblog/content/tumblog/index.txt", "examples/tumblog/content/tumblog/rss.txt", "examples/tumblog/layouts/tumblog/default.txt", "examples/tumblog/layouts/tumblog/post.txt", "examples/tumblog/lib/tumblog_helper.rb", "examples/tumblog/tasks/tumblog.rake", "examples/tumblog/templates/atom_feed.erb", "examples/tumblog/templates/tumblog/conversation.erb", "examples/tumblog/templates/tumblog/link.erb", "examples/tumblog/templates/tumblog/photo.erb", "examples/tumblog/templates/tumblog/post.erb", "examples/tumblog/templates/tumblog/quote.erb", "examples/webby/Sitefile", "examples/webby/content/css/background.gif", "examples/webby/content/css/blueprint/print.css", "examples/webby/content/css/blueprint/screen.css", "examples/webby/content/css/coderay.css", "examples/webby/content/css/site.css", "examples/webby/content/css/uv/twilight.css", "examples/webby/content/index.txt", "examples/webby/content/manual/index.txt", "examples/webby/content/reference/index.txt", "examples/webby/content/robots.txt", "examples/webby/content/script/jquery.corner.js", "examples/webby/content/script/jquery.js", "examples/webby/content/sitemap.txt", "examples/webby/content/tips_and_tricks/index.txt", "examples/webby/content/tutorial/index.txt", "examples/webby/layouts/default.txt", "examples/webby/templates/page.erb", "examples/website/Sitefile", "examples/website/content/css/blueprint/License.txt", "examples/website/content/css/blueprint/Readme.txt", "examples/website/content/css/blueprint/compressed/print.css", "examples/website/content/css/blueprint/compressed/screen.css", "examples/website/content/css/blueprint/lib/forms.css", "examples/website/content/css/blueprint/lib/grid.css", "examples/website/content/css/blueprint/lib/grid.png", "examples/website/content/css/blueprint/lib/ie.css", "examples/website/content/css/blueprint/lib/reset.css", "examples/website/content/css/blueprint/lib/typography.css", "examples/website/content/css/blueprint/plugins/buttons/Readme", "examples/website/content/css/blueprint/plugins/buttons/buttons.css", "examples/website/content/css/blueprint/plugins/buttons/icons/cross.png", "examples/website/content/css/blueprint/plugins/buttons/icons/key.png", "examples/website/content/css/blueprint/plugins/buttons/icons/tick.png", "examples/website/content/css/blueprint/plugins/css-classes/Readme", "examples/website/content/css/blueprint/plugins/css-classes/css-classes.css", "examples/website/content/css/blueprint/plugins/fancy-type/Readme", "examples/website/content/css/blueprint/plugins/fancy-type/fancy-type-compressed.css", "examples/website/content/css/blueprint/plugins/fancy-type/fancy-type.css", "examples/website/content/css/blueprint/print.css", "examples/website/content/css/blueprint/screen.css", "examples/website/content/css/coderay.css", "examples/website/content/css/site.css", "examples/website/content/index.txt", "examples/website/layouts/default.txt", "examples/website/lib/breadcrumbs.rb", "examples/website/templates/_partial.erb", "examples/website/templates/page.erb", "examples/website/templates/presentation.erb", "lib/webby.rb", "lib/webby/auto_builder.rb", "lib/webby/builder.rb", "lib/webby/core_ext/enumerable.rb", "lib/webby/core_ext/hash.rb", "lib/webby/core_ext/kernel.rb", "lib/webby/core_ext/string.rb", "lib/webby/core_ext/time.rb", "lib/webby/filters.rb", "lib/webby/filters/basepath.rb", "lib/webby/filters/erb.rb", "lib/webby/filters/haml.rb", "lib/webby/filters/markdown.rb", "lib/webby/filters/outline.rb", "lib/webby/filters/sass.rb", "lib/webby/filters/slides.rb", "lib/webby/filters/textile.rb", "lib/webby/filters/tidy.rb", "lib/webby/helpers.rb", "lib/webby/helpers/capture_helper.rb", "lib/webby/helpers/coderay_helper.rb", "lib/webby/helpers/graphviz_helper.rb", "lib/webby/helpers/tag_helper.rb", "lib/webby/helpers/tex_img_helper.rb", "lib/webby/helpers/ultraviolet_helper.rb", "lib/webby/helpers/url_helper.rb", "lib/webby/link_validator.rb", "lib/webby/main.rb", "lib/webby/main/generator.rb", "lib/webby/renderer.rb", "lib/webby/resources.rb", "lib/webby/resources/db.rb", "lib/webby/resources/file.rb", "lib/webby/resources/layout.rb", "lib/webby/resources/page.rb", "lib/webby/resources/partial.rb", "lib/webby/resources/resource.rb", "lib/webby/resources/static.rb", "lib/webby/stelan/mktemp.rb", "lib/webby/stelan/paginator.rb", "lib/webby/stelan/spawner.rb", "lib/webby/tasks/build.rake", "lib/webby/tasks/create.rake", "lib/webby/tasks/deploy.rake", "lib/webby/tasks/growl.rake", "lib/webby/tasks/heel.rake", "lib/webby/tasks/validate.rake", "spec/core_ext/hash_spec.rb", "spec/core_ext/string_spec.rb", "spec/core_ext/time_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/webby/helpers/capture_helper_spec.rb", "spec/webby/main/generator_spec.rb", "spec/webby/main_spec.rb", "spec/webby/resources/file_spec.rb", "spec/webby/resources_spec.rb", "tasks/ann.rake", "tasks/bones.rake", "tasks/gem.rake", "tasks/git.rake", "tasks/manifest.rake", "tasks/notes.rake", "tasks/post_load.rake", "tasks/rdoc.rake", "tasks/rubyforge.rake", "tasks/setup.rb", "tasks/spec.rake", "tasks/website.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://webby.rubyforge.org/}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{webby}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{static website creation and management}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<directory_watcher>, [">= 1.1.1"])
      s.add_runtime_dependency(%q<heel>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0.6.161"])
      s.add_runtime_dependency(%q<logging>, [">= 0.9.0"])
      s.add_runtime_dependency(%q<rake>, [">= 0.8.1"])
      s.add_runtime_dependency(%q<rspec>, [">= 1.1.4"])
    else
      s.add_dependency(%q<directory_watcher>, [">= 1.1.1"])
      s.add_dependency(%q<heel>, [">= 1.0.0"])
      s.add_dependency(%q<hpricot>, [">= 0.6.161"])
      s.add_dependency(%q<logging>, [">= 0.9.0"])
      s.add_dependency(%q<rake>, [">= 0.8.1"])
      s.add_dependency(%q<rspec>, [">= 1.1.4"])
    end
  else
    s.add_dependency(%q<directory_watcher>, [">= 1.1.1"])
    s.add_dependency(%q<heel>, [">= 1.0.0"])
    s.add_dependency(%q<hpricot>, [">= 0.6.161"])
    s.add_dependency(%q<logging>, [">= 0.9.0"])
    s.add_dependency(%q<rake>, [">= 0.8.1"])
    s.add_dependency(%q<rspec>, [">= 1.1.4"])
  end
end
