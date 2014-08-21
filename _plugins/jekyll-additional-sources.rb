module Jekyll
  class AdditionalSourcesGenerator < Generator

    def generate(site)
      root_source = site.source

      sources = site.config['additional_sources']
      sources.each do |source|
        site.source = source
        site.read_directories
        site.source = root_source
      end
    end

  end
end

