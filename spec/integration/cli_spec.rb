require 'spec_helper'

describe "Running Seneschal from the console" do
  it "prints the version with -v" do
    expect(`bundle exec bin/seneschal -v`.strip).to eq Seneschal::VERSION
  end
end
