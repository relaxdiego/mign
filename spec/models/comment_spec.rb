require 'spec_helper'

describe Comment do
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:ticket)  }
  it { should validate_presence_of(:author)  }
end
