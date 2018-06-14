class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.datetime :opening_date
      t.datetime :closing_date

      t.timestamps
    end
  end
end
