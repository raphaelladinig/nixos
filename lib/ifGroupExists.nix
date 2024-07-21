{ config, ... }:

{
  ifGroupExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
}
