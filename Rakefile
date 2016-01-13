task :unit do
  sh('rspec spec/unit')
end

task :integration do
  sh('rspec spec/integration')
end

task :acceptance do
  sh('rspec spec/acceptance')
end

namespace :ci do
  task :spec => [:unit, :integration]
end
