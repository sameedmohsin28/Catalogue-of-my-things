require_relative '../classes/book/book'

describe Book do
  before :all do
    @book = Book.new('05-09-2011', false, 'Crown Business', 'good')
  end

  it 'takes four parameters and returns a Book object' do
    expect(@book).to be_an_instance_of(Book)
  end

  context 'can_be_archived?()' do
    it 'returns true if parent method returns true or cover_state == bad' do
      expect(@book.can_be_archived?).to be(true)
    end
  end
end
