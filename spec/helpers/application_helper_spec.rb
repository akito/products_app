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
      it 'ページタイトルに@product.nameが入った文字列が返されること' do

        @product = Product.new(
          name: 'product_name',
          url: 'https://example.com',
          desc: 'this is cool service.'
        )

        stub_const('ApplicationHelper::APP_NAME', 'Products APP')
        expect(helper.page_title).to eq("Products APP | product_name")
      end
    end
  end
end
