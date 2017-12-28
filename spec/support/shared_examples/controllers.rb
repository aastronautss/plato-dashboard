RSpec.shared_examples_for 'an instance variable setter' do |*instance_variables|
  instance_variables.each do |var|
    it "sets @#{var}" do
      action
      expect(assigns[var]).to_not be_nil
    end
  end
end
