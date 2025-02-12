proc count_hierarchical_instances_by_ref_name {} {
      set instances [get_cells -filter "is_hierarchical==false"]
       set ref_count [dict create]
       foreach inst $instances {
        set ref_name [get_attribute $inst ref_name]
        foreach name $ref_name {
            if {[dict exists $ref_count $name]} {
                dict incr ref_count $name
            } else {
                dict set ref_count $name 1
            }
        }
    }
    foreach ref_name [lsort -dictionary [dict keys $ref_count]] {
        set count [dict get $ref_count $ref_name]
          if {[regexp {^logic_} $ref_name]} {
            puts "**$ref_name** : $count"
        } else {
            puts "$ref_name : $count"
        }
    }
}
count_hierarchical_instances_by_ref_name

