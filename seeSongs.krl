ruleset see_songs 
{
  meta 
  {
    name "See Songs"
    description << Lab 6 Part 1b - Songs >>
    author "Bobby Swingler"
    logging on
    sharing on 
  }

  rule songs is active 
  {
    select when echo message msg_type re/song/ setting(m)
    send_directive("sing") with
      song = m;
    always
    {
        raise explicit event sung with
        song = m;
    }

  }

  rule find_hymn is active
  {
      select when explicit sung song (".*god.*/i") setting(m)

      always
      {
          raise explicit event found_hymn with
          song = m;
          log "***** HYMN WAS FOUND";
      }
  }
 
}