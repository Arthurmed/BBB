FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../msg_gen"
  "../srv_gen"
  "../src/aristarko/msg"
  "../src/aristarko/srv"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/ins.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_ins.lisp"
  "../msg_gen/lisp/ins_info.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_ins_info.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
