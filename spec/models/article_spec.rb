require 'spec-helper'
require 'wiki-import'

describe 'The Article parser' do 
  before do 
    @article = Article.make 

    dummy_text = "<page><title>#{@article.title}</title><text><#{@article.text}</text></page>"
    document = WikiImport.new(logger) 

    # @document = double("WikiImport")
    # @document.should_receive(:start_document).once
    # @document.should_receive(:start_element_namespace)
    # @document.should_receive(:characters)
    # @document.should_receive(:end_element_namespace)
    # @document.should_receive(:end_document).once
    parser = Nokogiri::XML::SAX::Parser.new(document)
    
    parser.parse(dummy_text)

    end
  it "creates an Article in the database" do 
    Article.count.should eq(1)
    @actual = Article.first
    @actual.title.should = @article.title
    
  end
  
  it "should call start_document" do
    @parser.expects(:start_document)
  end
end 
