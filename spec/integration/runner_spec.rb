require 'integration_helper'
require 'test/component/runner'

describe 'The Runner' do
  context 'is very convienent on' do
    let(:runner) { Test::Component::Runner.new(['--customize']) }

    it 'osx', :if => IntegrationHelpers::Platform.osx? do
      expect(runner.hello!).to match(/osx/)
    end

    it 'windows', :if => IntegrationHelpers::Platform.windows? do
      expect(runner.hello!).to match(/windows/)
    end

    it 'linux', :if => IntegrationHelpers::Platform.linux? do
      expect(runner.hello!).to match(/linux/)
    end
  end
end
