let mod_cpp = HEMTT_VFS.join("mod.cpp").open_file().read();
mod_cpp.replace("0.0.0", HEMTT.project().version().to_string_short());
HEMTT_VFS.join("mod.cpp").create_file().write(mod_cpp);
print("Updated version in mod.cpp");