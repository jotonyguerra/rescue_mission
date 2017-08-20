class JoinAnswersQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :Answer_Questions do |t|
      t.integer :question_id, null: false
      t.integer :answer_id, null: false
    end
  end
end
