require "dry/rails"

Dry::Rails.container do
  config.component_dirs.add "app/operations"
  config.component_dirs.add "lib" do |dir|
    dir.namespaces.add "mimesweeper", key: nil
  end
end
