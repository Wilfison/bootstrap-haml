# frozen_string_literal: true

require_relative 'build/build_component.rb'

config = {
  components_folder: 'src/components',
  build_to_folder: 'docs/components',
  bootstrap_version: '4.5'
}

components = ['alerts.html']

# load layout
file = File.open('src/layout/index.html')
layout_content = file.read
file.close

components.each do |component|
  build_content(layout_content, component, config)
end
