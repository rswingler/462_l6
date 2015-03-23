ruleset echo 
{
  meta 
  {
    name "Echo Server"
    description << Lab 6 Part 1 - Echo Server >>
    author "Bobby Swingler"
    logging on
    sharing on 
  }

  rule hello is active 
  {
    select when echo hello
    send_directive("say") with
      something = "Hello World";
  }
  rule message is active 
  {
    select when echo message input "(.*)" setting(m)
    send_directive("say") with
      something = m;
  }
 
}