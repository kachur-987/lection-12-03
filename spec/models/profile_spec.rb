require 'rails_helper'

RSpec.describe Profile, type: :model do
  let!(:user){create(:user)}

  subject{
     build(:profile, user: user)
  }

  context "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "should not be valid without nickname" do
       subject.nickname = nil
       expect(subject).to_not be_valid
    end
    
    it { should validate_presence_of(:nickname) }
  end

  context "association" do
    it { should belong_to(:user) }
  end


 context "when user nickname is already taken" do
   before do 
    profile_dub = create(:profile, user: user)
   end
   
   it { should_not be_valid }  
 end
 
end
