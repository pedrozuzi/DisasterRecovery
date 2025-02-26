az login --identity --username dbc829ea-5a17-4b92-bf13-4cf1c7fc52e3


az postgres flexible-server replica promote --resource-group rg-db-secondary --name flexdbsecondarydb --promote-mode switchover --promote-option planned --yes y

