class AddUsersAndCitiesToUserByCities < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_by_cities, :user, foreign_key: true
    add_reference :user_by_cities, :city, foreign_key: true
  end
end
