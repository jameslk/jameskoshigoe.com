module Jekyll
  class AdditionalSourcesGenerator < Generator

    def generate(site)
      root_source = site.source

      sources = site.config['additional_sources']
      sources.each do |source|
        site.instance_variable_set(:@source, File.join(root_source, source))
        site.read_directories
      end

      site.instance_variable_set(:@source, root_source)
    end

  end
end

