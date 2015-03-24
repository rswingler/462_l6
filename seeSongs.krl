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
    select when echo message input "(.*)" setting(m)
    send_directive("sing") with
      song = m;
  }
 
}