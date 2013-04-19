require File.expand_path('../support/helpers', __FILE__)

describe 'nutch::default' do

  include Helpers::Nutch

  # Example spec tests can be found at http://git.io/Fahwsw
  it "creates the nutch binary" do
    file("/opt/nutch/bin/nutch").must_exist
  end

  it "creates the crawl binary" do
    file("/opt/nutch/bin/crawl").must_exist
  end
  
end