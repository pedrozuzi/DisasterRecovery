locals {
  input = file("${path.module}/asr_failback.ps1")

  map = {
    clientidtoreplace = var.client_id
  }

  runbook = join("\n", [
    for line in split("\n", local.input) :
    format(
      replace(line, "/{(${join("|", keys(local.map))})}/", "%s"),
      [
        for value in flatten(regexall("{(${join("|", keys(local.map))})}", line)) :
        lookup(local.map, value)
      ]...
    )
  ])
}

output "asr_failback_script" {
  value = local.runbook
}