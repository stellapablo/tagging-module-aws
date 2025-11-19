variable "tags" {
  description = "(Optional) Common Tags."
  default     = {}
  validation {
    condition = alltrue([
      contains(keys(var.tags), "KmsCustom") ? contains(["true", "false"], var.tags["KmsCustom"]) : false,
      contains(keys(var.tags), "EnableBackup") ? contains(["true", "false"], var.tags["EnableBackup"]) : false
    ])
    error_message = "Los tags 'KmsCustom' y 'EnableBackup' deben estar presentes y tener valores 'true' o 'false'."
  }
}