require 'rails_helper'

describe ItemsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new

    end
  end

  describe 'GET #edit' do
    it "renders the :edit template" do
      item = create(:item)
      get :edit, params: { id: item }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of items ordered by created_at DESC" do
      items = create_list(:item, 1) 
      get :index
      expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end