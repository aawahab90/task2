class SizesController < ApplicationController

  def show
  	sizes = Size.where(customer_id: params[:customer_id])
  				      .order(:answer_type, :attribute_id)
  	if sizes.present?
  		@sizes = {}
  		sizes.each{|row| @sizes[SIZES.key(row.attribute_id)] = row.value}
  		render json: @sizes, status: 200
  	else
  		json_response(Message.not_found("Record with id=#{params[:customer_id]}"))
  	end 
  end

  def update
  	attributes = size_params.keys.map{|key| SIZES[key]}
  	@sizes = Size.where(customer_id: params[:customer_id], attribute_id: attributes)
  	if @sizes.present? && prepare_update_data
  		Size.update(@data.keys, @data.values)
  		json_response(Message.success("Sizes are successfully updated"))
  	else
  		json_response(Message.not_found("Record with id=#{params[:customer_id]}"))
  	end
  end

  private

  def size_params
  	params.permit(:height, :weight, :top_size, :trousers_size, :jacket_size, :shoes_size)
  end

  def prepare_update_data
  	@data = {}
  	@sizes.each{|row| @data[row.id] = {value: params[SIZES.key(row.attribute_id)]}}
  	@data
  end
end
