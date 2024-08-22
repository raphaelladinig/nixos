{ prev }:
{
  specific = prev.zen-browser.override { policiesFilePath = "${./policies.json}"; };
}
