RSpec.shared_examples_for 'an instance variable setter' do |*instance_variables|
  instance_variables.each do |var|
    it "sets @#{var}" do
      action
      expect(assigns[var]).to be_present
    end
  end
end
