//https://github.com/sameershah21/terraform_dynamic_objects_with_nested_iteration.git
locals {

  level_1_object_1 = {
    level_2_object_1 = {
      level_3_object_1 = {
        level_4_object_1 = [
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",

          },

          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          }
        ],
        level_4_object_2 = [
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",

          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",

          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",


          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",


          }
        ],
        level_4_object_3 = [
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",


          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",

          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",

          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",

          }
        ],
        level_4_object_4 = [
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",

          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",

          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          }

        ],
        level_4_object_5 = [
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          }
        ],
      },

      level_3_object_2 = {
        level_4_object_1 = [
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          }
        ]


        level_4_object_2 = [
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },
        ],
        level_4_object_3 = [ #
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },

        ],
        level_4_object_4 = [ #
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },
        ],
        level_4_object_5 = [ #
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          },
          {
            level_5_object_1 = "level_5_object_1",
            level_5_object_2 = "level_5_object_2",
          }
        ]
      }

    },
    // you can uncomment the following to see level_2 object iteration in action
    //    level_2_object_2 = {
    //      level_3_object_1 = {
    //        level_4_object_1 = [
    //          {
    //            level_5_object_1 = "v1",
    //            level_5_object_2     = "v2",
    //          },
    //        ]
    //      },
    //      level_3_object_2 = {
    //        level_4_object_1 = [
    //          {
    //            level_5_object_1 = "v1",
    //            level_5_object_2     = "v2",
    //          },
    //        ]
    //      },
    //    }
  }

  iterate_item_groups = (flatten([
    for index_dd_objects, item_dd_objects in local.level_1_object_1 : [ # will loop in parallel over index and sequenced_item/map_item in local.level_1_object_1 array
      for index_services, item_services in item_dd_objects : [          # will loop in parallel over index and sequenced_item/map_item in item_dd_objects array
        for index_groups, item_groups in item_services : {
          # will loop in parallel over index and sequenced_item/map_item in item_services array
          index_dd_objects = index_dd_objects
          index_groups     = index_groups
          index_services   = index_services
        }
      ]
    ]
  ]))

  to_use_list_item_groups = (flatten([
    for index_dd_objects, item_dd_objects in local.level_1_object_1 : [
      for index_services, item_services in item_dd_objects : [
        for index_groups, item_groups in item_services : [
          for index_elements, item_elements in item_groups : {
            index_dd_objects     = index_dd_objects
            index_services       = index_services
            index_dynamic_object = index_groups
            level_5_object_2     = item_elements.level_5_object_2
            level_5_object_1     = item_elements.level_5_object_1
          }
        ]
      ]
  ]]))

  to_use_list_item_services = toset(flatten([
    for index_dd_objects, item_dd_objects in local.level_1_object_1 : [
      for index_services, item_services in item_dd_objects :
      tostring(index_services)
    ]
  ]))
}

resource "some_terraform_resource_type" "resource_instance" {
  for_each         = local.to_use_list_item_services
  level_5_object_1 = "${each.value} level_2_object_1"

  //static declaration example
  template_variable {
    name    = "template_variable_3"
    prefix  = "template_variable_3"
    default = "template_variable_3"
  }

  //dynamic declaration example

  dynamic "template_variable" {
    for_each = each.value == "level_3_object_2" ? ["level_3_object_2"] : [] //workaround for conditional match

    content {
      name    = "template_variable_1"
      prefix  = "template_variable_1"
      default = "template_variable_1"
    }
  }
  dynamic "template_variable" {
    for_each = each.value == "level_3_object_2" ? ["level_3_object_2"] : []

    content {
      name    = "template_variable_2"
      prefix  = "template_variable_2"
      default = "*"
    }
  }
  dynamic "dynamic_object" {
    for_each = { for dd_indices in local.iterate_item_groups :
      dd_indices.index_groups => dd_indices #just an index reference of any value within the list to an object will pull in the entire set
      if dd_indices.index_services == each.value
    }
    iterator = indices_count

    content {
      #dynamic dynamic_objects
      level_5_object_1 = indices_count.value.index_groups
      dynamic "nested_dynamic_object" {
        for_each = { for dynamic_object_elements in local.to_use_list_item_groups :
          dynamic_object_elements.level_5_object_1 => dynamic_object_elements #just an index reference of any value within the list to an object will pull in the entire set
          if dynamic_object_elements.index_dynamic_object == indices_count.value.index_groups && dynamic_object_elements.index_services == indices_count.value.index_services
        }
        iterator = elements_count
        content {

          level_5_object_1 = elements_count.value.level_5_object_1
          level_5_object_2 = elements_count.value.level_5_object_2

        }
      }
    }
  }
}

