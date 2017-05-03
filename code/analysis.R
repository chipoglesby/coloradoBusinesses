typeCount <- entities %>% 
  group_by(entitytypeverbatim) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

head <- head(entities)

zipCodeCount <- entities %>% 
  group_by(agentprincipalzipcode) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

agentNameCount <- entities %>% 
  group_by(agentorganizationname) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

corpCompany <- entities %>% 
  filter(agentorganizationname == 'the corporation company')