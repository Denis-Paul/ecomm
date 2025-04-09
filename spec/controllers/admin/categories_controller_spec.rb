require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :request do
  include Devise::Test::IntegrationHelpers

  let(:admin) { create(:admin) }
  let(:category) { create(:category) }

  let(:valid_attributes) { attributes_for(:category) }
  let(:invalid_attributes) { { name: "", description: "" } }

  before { sign_in admin }

  describe "GET /index" do
    it "returns a successful response" do
      category
      get admin_categories_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /show" do
    it "returns a successful response" do
      get admin_category_path(category)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /new" do
    it "returns a successful response" do
      get new_admin_category_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /edit" do
    it "returns a successful response" do
      get edit_admin_category_path(category)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Category and redirects" do
        expect {
          post admin_categories_path, params: { category: valid_attributes }
        }.to change(Category, :count).by(1)

        expect(response).to redirect_to(admin_category_path(Category.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Category and re-renders form" do
        expect {
          post admin_categories_path, params: { category: invalid_attributes }
        }.not_to change(Category, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the category and redirects" do
        patch admin_category_path(category), params: { category: { name: "Updated" } }
        expect(response).to redirect_to(admin_category_path(category))
        expect(category.reload.name).to eq("Updated")
      end
    end

    context "with invalid parameters" do
      it "does not update and re-renders form" do
        patch admin_category_path(category), params: { category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "deletes the category and redirects" do
      category_to_delete = create(:category)
      expect {
        delete admin_category_path(category_to_delete)
      }.to change(Category, :count).by(-1)

      expect(response).to redirect_to(admin_categories_path)
    end
  end
end
