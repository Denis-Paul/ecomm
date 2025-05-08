require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :request do
  include Devise::Test::IntegrationHelpers

  let(:admin) { create(:admin) }
  let(:category) { create(:category) }
  let(:product) { create(:product, category: category) }

  let(:valid_attributes) do
    {
      name: "T-shirt",
      description: "Cotton T-shirt",
      price: 2500,
      category_id: category.id,
      active: true
    }
  end

  let(:invalid_attributes) do
    {
      name: "",
      description: "",
      price: nil,
      category_id: nil,
      active: false
    }
  end

  before { sign_in admin }

  describe "GET /index" do
    it "returns a successful response" do
      product
      get admin_products_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /show" do
    it "returns a successful response" do
      get admin_product_path(product)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /new" do
    it "returns a successful response" do
      get new_admin_product_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /edit" do
    it "returns a successful response" do
      get edit_admin_product_path(product)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Product and redirects" do
        expect {
          post admin_products_path, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)

        expect(response).to redirect_to(admin_product_path(Product.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Product and re-renders form" do
        expect {
          post admin_products_path, params: { product: invalid_attributes }
        }.not_to change(Product, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the product and redirects" do
        patch admin_product_path(product), params: { product: { name: "Updated Name" } }
        expect(response).to redirect_to(admin_products_path)
        expect(product.reload.name).to eq("Updated Name")
      end
    end

    context "with invalid parameters" do
      it "does not update and re-renders form" do
        patch admin_product_path(product), params: { product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "deletes the product and redirects" do
      product_to_delete = create(:product, category: category)
      expect {
        delete admin_product_path(product_to_delete)
      }.to change(Product, :count).by(-1)

      expect(response).to redirect_to(admin_products_path)
    end
  end
end
