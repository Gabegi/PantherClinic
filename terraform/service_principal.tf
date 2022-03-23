# data "azuread_client_config" "current" {}

# data "azuread_user" "user" {
#   user_principal_name = "adm_GPirastru@adm.lelyonline.com"
#   display_name        = "Group Owner"
# }


# resource "azuread_group" "this" {
#   display_name     = "123azuread_group"
#   owners           = [
#     data.azuread_client_config.current.object_id,
#     azuread_user.group_owner.object_id,
#     ]
#         lifecycle {
#     ignore_changes = [
#       owners,
#     ]
#    }

#   security_enabled = true
#   prevent_duplicate_names = true
#   provider = azuread.groups
# }