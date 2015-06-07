class ChangeEmailAddressesToContacts < ActiveRecord::Migration
  def up
    EmailAddress.destroy_all
    remove_column :email_addresses, :person_id
    add_reference :email_addresses, :contact, polymorphic: true, index: true
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
