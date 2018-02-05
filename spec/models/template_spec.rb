require 'rails_helper'
RSpec.describe Template, type: :model do
  before(:all) do
    opt_file = Rails.root.join('doc/operational_templates/VitalSignDemo.opt')
    @template = Template.create(file: opt_file.to_s)
  end

  example 'successful creation template from opt file' do
    expect(@template.status).to eq 200
  end

  
  example 'get all templates' do
    templates = Template.all
    expect(templates.size).to eq 2
  end

  xexample 'delete template' do
    expect(@template.delete.status).to eq 200
  end
end
