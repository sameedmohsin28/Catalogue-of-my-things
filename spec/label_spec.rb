require_relative '../classes/book/label'
require_relative 'mocks/book_mock_for_label'

describe Label do
  before :all do
    @label = Label.new('World Order', 'Pink')
    @book_mock = BookMock.new('09-09-2014', 'Penguin Publishers', 'good')
    @label.add_item(@book_mock)
  end

  it 'takes two parameters and creates an object of Label' do
    expect(@label).to be_an_instance_of(Label)
  end

  context 'add_item()' do
    it 'items array contains @book instance' do
      expect(@label.items).to include(@book_mock)
    end

    it '@book.label contains @label instance' do
      expect(@book_mock.label).to eql(@label)
    end
  end
end
