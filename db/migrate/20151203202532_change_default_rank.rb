class ChangeDefaultRank < ActiveRecord::Migration
  def change
    change_column_default :media, :ranking, 0

  end
end
