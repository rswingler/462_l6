ruleset song_store 
{
  meta 
  {
    name "Song Store"
    description << Lab 6 Part 3 >>
    author "Bobby Swingler"
    logging on
    sharing off
    provides songs, hymns, secular_music
  }

  global 
  {
      songs = function() {
        ent:songs
      };

      hymns = function() {
        ent:hymns
      };

      secular_music = function() {
        songs.difference(hymns);
      };
  }


  rule collect_songs is active
  {
      select when explicit sung song "(.*)" setting(m)

      pre
      {
          allSongs = ent:songs || [];
          allSongs = allSongs.append({"song":m, "timestamp":time:now()});
      }

      always
      {
         set ent:songs allSongs;
         log "Song added: " + m;
      }
  }

  rule collect_hymns is active
  {
      select when explicit found_hymn hymn "(.*)" setting(m)

      pre
      {
          allHymns = ent:hymns || [];
          allHymns = allHymns.append({"hymn":m, "timestamp":time:now()});
      }

      always
      {
         set ent:hymns allHymns;
         log "Hymn added: " + m;
      }
  }

  rule clear_songs is active
  {
      select when song reset
      always
      {
          set ent:songs [];
          set ent:hymns [];
          log "entities reset";
      }
  } 
}