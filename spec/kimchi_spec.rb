require 'spec_helper'

json = <<-JSON
{
   "_index":"omnibus",
   "_type":"Music::Album",
   "_id":"5871280",
   "_version":2,
   "exists":true,
   "_source":{
      "advisory":false,
      "artist_text":"Britney Spears",
      "artists":[
         {
            "id":4035358,
            "type":"Music::Participant"
         }
      ],
      "copyright":"(P) 2011 JIVE Records, a unit of Sony Music Entertainment",
      "created_at":"2011-03-18T12:07:57-04:00",
      "disc_count":1,
      "genre":"Pop",
      "graphic":{
         "id":5871278,
         "type":"Music::Graphic"
      },
      "id":5871280,
      "instances":[
         {
            "id":5871279,
            "type":"Music::DigitalAlbum"
         }
      ],
      "keys":{
         "upc":"884977898842",
         "t_grid":"G0100020698940",
         "ip_id":2.3453528E7
      },
      "label":"Jive",
      "meta":{
         "publish_records":[
            {
               "timestamp":"2013-09-25T18:13:52.061815947Z",
               "store_permalink":"britney-spears-us",
               "store_id":4820059
            },
            {
               "timestamp":"2013-09-25T19:08:01.95788026Z",
               "store_id":5754839,
               "store_permalink":"britney-spears-jp"
            }
         ]
      },
      "release_records":[
         {
            "id":5871219,
            "type":"Music::PermanentReleaseRecord"
         }
      ],
      "title":"Femme Fatale (Deluxe Version)",
      "type":"Music::Album",
      "updated_at":"2011-03-18T12:07:57-04:00",
      "year":2011
   }
}
JSON
