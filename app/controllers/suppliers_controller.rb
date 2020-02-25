class SuppliersController < ApplicationController

before_action :set_supplier, only: [:show, :update, :destroy]

  def index
    @suppliers = Supplier.all
    json_response(@suppliers)
  end

  def create
    supplier = Supplier.create!(supplier_params)
    json_response(supplier, :created)
  end

  def show
    json_response(@supplier)
  end

  def update
    @supplier.update(supplier_params)
    head :no_content
  end

  def destroy
    @supplier.destroy
    head :no_content
  end

  private

  def supplier_params
    params.require(:supplier).permit!
  end

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end
end
