require 'rails/all'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#page_title" do
    context '@productが指定されてない場合' do
      it 'defaultのtitleが返されること' do
        stub_const('ApplicationHelper::APP_NAME', 'Products APP')
        expect(helper.page_title).to eq('Products APP')
      end
    end
    context '@productが指定されてる場合' do
      # TODO: Productの作り方がわからない
      # before do
      #   assign(:product.name, "hoge")
      # end
      # it 'ページタイトルに@product.nameが入った文字列が返されること' do
      #   stub_const('ApplicationHelper::APP_NAME', 'Products APP')
      #   expect(helper.page_title).to eq("Products APP | hoge")
      # end
    end
  end
end
