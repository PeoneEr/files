class AddColumnDirToUserFimm < ActiveRecord::Migration
  def change
    add_column :user_films, :dir, :string
  end
end
