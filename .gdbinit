# gdb macros which may be useful for folks using gdb to debug
# apache.  Delete it if it bothers you.

define dump_table
    set $t = (apr_table_entry_t *)((apr_array_header_t *)$arg0)->elts
    set $n = ((apr_array_header_t *)$arg0)->nelts
    set $i = 0
    while $i < $n
	printf "[%u] '%s'='%s'\n", $i, $t[$i].key, $t[$i].val
	set $i = $i + 1
    end
end
document dump_table
    Print the key/value pairs in a table.
end


define rh
	run -f /home/dgaudet/ap2/conf/mpm.conf
end

define dump_string_array
    set $a = (char **)((apr_array_header_t *)$arg0)->elts
    set $n = (int)((apr_array_header_t *)$arg0)->nelts
    set $i = 0
    while $i < $n
	printf "[%u] '%s'\n", $i, $a[$i]
	set $i = $i + 1
    end
end
document dump_string_array
    Print all of the elements in an array of strings.
end
