# frozen_string_literal: true

# load file content
def load_file(file_name, config)
  file = File.open("#{config[:components_folder]}/#{file_name}")
  file_content = file.read
  file.close

  file_content
end

def build_title(file_name, config)
  name = file_name.sub('.html', '').sub('-', ' ').capitalize
  
  "<title>#{name} · HAML Bootstrap v#{config[:bootstrap_version]}</title>"
end

def build_content(layout_content, file_name, config = {})
  file_content = load_file(file_name, config)
  title = build_title(file_name, config)

  # build content
  component_content = layout_content.sub('<root></root>', file_content)
  component_content = component_content.sub('<title>Bootstrap</title>', title)

  # generate file
  File.open("#{config[:build_to_folder]}/#{file_name}", 'w') do |f|
    f.write(component_content)
  end
end
