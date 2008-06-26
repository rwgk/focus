Import("env_base", "env_etc")

focus_scons_env = env_base.Copy(
  CCFLAGS=env_etc.ccflags_base,
  LINK=env_etc.c_link,
  LIBS=env_etc.libm
)
env_etc.enable_more_warnings(env=focus_scons_env)

Export("focus_scons_env")

SConscript("src/sginfo/SConscript")
SConscript("src/focus/SConscript")
