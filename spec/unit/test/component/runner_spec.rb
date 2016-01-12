require 'unit_helper'
require 'test/component/runner'

RSpec.describe Test::Component::Runner do
  let(:runner) { Test::Component::Runner.new([]) }

  it 'should be awesome' do
    expect(runner.respond_to? :run!).to be true
  end
end
