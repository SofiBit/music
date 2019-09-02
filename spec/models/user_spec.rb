describe User do
  context '#admin?' do
    subject do
     described_class.new(email: "sonya@example.com", password: "password",
       role: "admin")
    end

    it "should return true" do
      expect(subject.admin?).to be true
    end
  end
end
