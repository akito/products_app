# class RegistrationController < ApplicationController
#   def new
#     @registration = Form::Registration.new
#   end
#
#   def edit
#   end
#
#   def create
#     @registration = Form::Registration.new(registration_params)
#     if @registration.register
#       redirect_to @product, notice: 'プロダクトは正しく申請されました'
#     else
#       render :new
#     end
#     end
#
#   def update
#     if @registration.update(registration_params)
#       redirect_to @product, notice: 'プロダクト情報は更新されました'
#     else
#       render :edit
#     end
#   end
#
#   private
#
#     def registration_params
#       params.require(:product).permit(:name, :url, :desc, :image, :thumbnail, :tags_to_s)
#     end
# end
