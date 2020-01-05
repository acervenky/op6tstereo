##########################################################################################
#
# Copy original mixer_paths_tavil.xml and run script to add stereo effects into it.
# 
#
##########################################################################################

# Copy files and run scripts
mkdir -p $MODPATH/system/vendor/etc
ui_print "**************************************************"
ui_print " - Copying mixer_paths_tavil into magisk module -"
cp -f /system/vendor/etc/mixer_paths_tavil.xml $MODPATH/system/vendor/etc/mixer_paths_tavil.xml
ui_print " - Done"
ui_print " - Adding stereo effects into mixer_paths_tavil -"
. $MODPATH/.aml.sh
ui_print " - Done -"
ui_print "**************************************************"

# Default permissions
set_perm_recursive $MODPATH 0 0 0755 0644
