def run_spec(file)
  unless File.exist?(file)
    puts "#{file} does not exist"
    return
  end

  puts "Running #{file}"
  system "jasmine-headless-webkit -c -j spec/support/jasmine.yml #{file}"
  puts
end

watch("spec/feathercache_spec.coffee") do |match|
  run_spec "spec/feathercache_spec.coffee"
end

watch("src/feathercache.coffee") do |match|
  run_spec "spec/feathercache_spec.coffee"
end
