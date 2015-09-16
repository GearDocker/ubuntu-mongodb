require 'spec_helper'


describe 'Mongodb checks ...' do

  it 'should have a mongodb user' do
    expect(user 'mongodb').to exist
  end

  it 'should be running the mongod server' do
    expect(service 'mongod').to be_running
    expect(service 'mongodb').to be_enabled
  end

  it 'should be running the monit server' do
    expect(service 'monit').to be_running
    expect(service 'monit').to be_enabled
  end

end


