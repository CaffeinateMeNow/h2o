require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  context "A question" do
    should_belong_to :question_instance
    should_belong_to :user

    should_validate_presence_of :question
    should_ensure_length_in_range :question, 0..10000

    should_ensure_length_in_range :email, 0..250
    should_ensure_length_in_range :name, 0..250

    should_not_allow_values_for :email, 'foobar','bee','@ff.com'
    should_allow_values_for :email, 'foo@bar.com','foo+bar@com.com', 'foo.bar@com.com', 'foo@bar.person'

    [:parent_id, :children_count, :ancestors_count, :descendants_count].each do |col|
      should_validate_numericality_of col
    end

  end
end
