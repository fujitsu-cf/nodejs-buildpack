require 'roda'

class App < Roda
  plugin :default_headers, 'Content-Type'=>'application/json'

  route do |r|
    r.on 'v2/catalog' do
      open('catalog.json').read
    end

    r.on 'v2/service_instances', String do |name|
      r.on 'service_bindings', String  do |sbid|
        '{"credentials": {"apiToken":"snyk-secret-token"}}'
      end

      r.on do
        '{"dashboard_url": "http://example.com"}'
      end
    end

  end
end

run App.freeze.app
