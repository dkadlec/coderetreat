require 'spec_helper'

RSpec.describe Test1 do
  context '#test' do
    it 'should returns text' do
      expect(Test1.test).to eq('test')
    end
  end
end