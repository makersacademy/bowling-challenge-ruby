feature 'homepage' do 
  scenario 'First homepage visit; has name fields :' do 
    visit '/'
    expect(page).to have_field('player_1_name')
    expect(page).to have_field('player_2_name')
  end

  scenario 'Players fill out names and confirm' do 
    visit '/'
    fill_in :player_1_name, with: "james"
    fill_in :player_2_name, with: "alex"
    click_button("Continue")
    expect(page).not_to have_field('player_1_name')
    expect(page).not_to have_content('Please Enter Names')
    expect(page).to have_content('james vs alex')
  end

end 