class CreateQuizSubmissions < ActiveRecord::Migration[8.0]
  def change
    create_table :quiz_submissions do |t|
      t.string :first_name
      t.string :surname
      t.string :email
      t.integer :score
      t.string :result
      t.json :answers

      t.timestamps
    end
  end
end
