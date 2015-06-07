require 'rails_helper'

describe 'the company view', type: :feature do
  let(:company) {Company.create(name: "The Empire")}

  describe 'phone numbers' do
    before(:each) do
      company.phone_numbers.create(number: "555-1212")
      company.phone_numbers.create(number: "555-3333")
      visit company_path(company)
    end

    it 'shows the phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type: "Company"))
    end

    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      page.click_button('Create Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-8888')
    end

    it 'has links to edit phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = company.phone_numbers.last
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9191')
      page.click_on('Update Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-9191')
      expect(page).not_to have_content(old_number)
    end

    it 'has links to delete phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('delete', href: phone_number_path(phone))
      end
    end

    it 'deletes a phone number' do
      phone = company.phone_numbers.last
      number = phone.number

      expect(page).to have_content(number)
      first(:link, 'delete').click
      expect(current_path).to eq(company_path(company))
      expect(page).not_to have_content(number)
    end
  end
end
