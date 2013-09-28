require 'spec_helper'

search_response = '{"took":27,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":1,"max_score":1.0,"hits":[{"_index":"omnibus","_type":"Music::Album","_id":"5871280","_score":1.0, "_source" : {"advisory":false,"artist_text":"Britney Spears","artists":[{"id":4035358,"type":"Music::Participant"}],"copyright":"(P) 2011 JIVE Records, a unit of Sony Music Entertainment","created_at":"2011-03-18T12:07:57-04:00","disc_count":1,"genre":"Pop","graphic":{"id":5871278,"type":"Music::Graphic"},"id":5871280,"instances":[{"id":5871279,"type":"Music::DigitalAlbum"}],"keys":{"upc":"884977898842","t_grid":"G0100020698940","ip_id":2.3453528E7},"label":"Jive","meta":{"publish_records":[{"timestamp":"2013-09-25T18:13:52.061815947Z","store_permalink":"britney-spears-us","store_id":4820059},{"timestamp":"2013-09-25T19:08:01.95788026Z","store_id":5754839,"store_permalink":"britney-spears-jp"}]},"release_records":[{"id":5871219,"type":"Music::PermanentReleaseRecord"}],"title":"Femme Fatale (Deluxe Version)","type":"Music::Album","updated_at":"2011-03-18T12:07:57-04:00","year":2011}}]}}'

describe Kimchi do
  let(:response){ Kimchi::Elasticsearch::SearchResponse.load search_response } 
  
  it 'took' do
    response.took.should == 27    
  end

  it 'timed_out' do
    response.timed_out.should == false
  end

  it 'shards' do
    response._shards.total.should == 5
    response._shards.successful.should == 5
    response._shards.failed.should == 0
  end

  it 'total' do
    response.total.should == 1
  end

  it 'max_score' do
    response.max_score.should == 1
  end

  it 'hits' do
    response.hits.should be_a_kind_of(Array)
    response.hits.first.should be_a_kind_of(Kimchi::Elasticsearch::Hit)
    response.facets.should be
  end

end