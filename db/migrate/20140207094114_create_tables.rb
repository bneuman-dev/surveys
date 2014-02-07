class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.timestamps
    end

    create_table :surveys do |t|
      t.string :title
      t.text :description
      t.string :pic_url
      t.integer :creator_id
      t.timestamps
    end

    create_table :user_surveys do |t|
      t.belongs_to :user
      t.belongs_to :survey
      t.timestamps
    end

    create_table :questions do |t|
      t.string :question
      t.belongs_to :survey
      t.timestamps
    end

    create_table :possible_answers do |t|
      t.string :text
      t.belongs_to :question
      t.timestamps
    end

    create_table :responses do |t|
      t.belongs_to :possible_answer
      t.belongs_to :user
      t.timestamps
    end

    add_index :surveys, :creator_id
    add_index :user_surveys, :user_id
    add_index :user_surveys, [:survey_id, :user_id]
    add_index :questions, :survey_id
    add_index :possible_answers, :question_id
    add_index :responses, :user_id
    add_index :responses, [:possible_answer_id, :user_id]
  end
end
