class ChangePhoneNumbersToContacts < ActiveRecord::Migration
  def up
    PhoneNumber.destroy_all
    remove_column :phone_numbers, :person_id
    add_reference :phone_numbers, :contact, polymorphic: true, index: true
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
