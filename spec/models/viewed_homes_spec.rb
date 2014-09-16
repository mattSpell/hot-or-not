require 'rails_helper'

RSpec.describe ViewedHome, :type => :model do
  it { should belong_to :user }
  it { should belong_to :home }
end
