require 'rails_helper'
 RSpec.describe McqBlock::QuestionsController, type: :controller do
  before(:all) do |example|
    McqBlock::Question.create( option_title: "mela", question_id: 5, option_input_type: 1234, is_correct: true, correct_order: 0)
  end
  describe "Post #show_options" do
    context "when the question exists" do
      it "returns a JSON response with the question options" do
        post :show_options, params: { id: question.id }
        expect(response).to have_http_status(:ok)
      end
    end
      context "when the question does not exist" do
        it "returns a 404 error" do
          post :show_options, params: { id: "invalid_id" }
          expect(response).to have_http_status(:not_found)
        end
      end

  end
end