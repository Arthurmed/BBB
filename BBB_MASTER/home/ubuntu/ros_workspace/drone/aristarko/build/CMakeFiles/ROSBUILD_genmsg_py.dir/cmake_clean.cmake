FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../msg_gen"
  "../srv_gen"
  "../src/aristarko/msg"
  "../src/aristarko/srv"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/aristarko/msg/__init__.py"
  "../src/aristarko/msg/_ins.py"
  "../src/aristarko/msg/_ins_info.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
