require 'rubocop'
require 'rubocop-rspec'

app_root = File.expand_path('../../', __FILE__)
CONFIG_FILE_PATH = File.join(app_root, 'config', 'rubocop_spec.yml')

describe RuboCop do
  let(:args) { ['--format', 'simple', '-D', '--config', CONFIG_FILE_PATH, app_root] }

  it 'passes all cops' do
    expect { RuboCop::CLI.new.run(args) }.to output(/no offenses detected/).to_stdout
  end
end
