class CreateAppTags < ActiveRecord::Migration[5.2]
  def change
    create_table :app_tags do |t|
      t.references :app, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
