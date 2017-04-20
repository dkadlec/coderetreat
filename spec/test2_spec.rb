require 'spec_helper'

RSpec.describe Test2 do
  context '#test' do
    it 'should returns text' do
      expect(Test2.test).to eq('test')
    end
  end
end