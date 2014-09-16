require 'rails_helper'

RSpec.describe Home, :type => :model do
  it { should have_many :viewed_homes }
end
