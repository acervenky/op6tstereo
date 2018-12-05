RUNONCE=true

patch_mixer_toplevel() {
  case $1 in
    -c) if [ "$(grep "<ctl name=\"$2\" value=\".*\" />" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml)" ]; then
          local num=$(sed -n "/<ctl name=\"$2\" value=\".*\" \/>/=" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml | head -n1)
          sed -i "$num s/\(<ctl name=\"$2\" value=\"\).*\(\" \/>\)/\1$3\2/" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml
        fi;;
    -p) if [ "$(sed -n "/ *<path name=\"$2\">/,/ *<\/path>/ {/<ctl name=\"$3\" value=\".*\" \/>/p}" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml)" ]; then
          sed -i "/ *<path name=\"$2\">/,/ *<\/path>/ s/\(<ctl name=\"$3\" value=\".*\" \/>\)/\1\n        <ctl name=\"$4\" value=\"$5\" \/>/" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml
        fi;;
  esac
}

patch_mixer_toplevel -c "SLIM RX0 MUX" "AIF1_PB"
patch_mixer_toplevel -c "RX INT0_1 MIX1 INP0" "RX0"
sed -i "/ *<path name=\"deep-buffer-playback quat_i2s\">/a\      <ctl name=\"SLIMBUS_0_RX Audio Mixer MultiMedia1\" value=\"1\" \/>\n\
      <ctl name=\"RX0 HPF cut off\" value=\"MIN_3DB_150Hz\" \/>\n\
      <ctl name=\"RX0 Digital Volume\" value=\"84\" \/>\n\
      <ctl name=\"RX7 Digital Volume\" value=\"84\" \/>\n\
      <ctl name=\"SLIM_0_RX SampleRate\" value=\"KHZ_96\" \/>" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml
sed -i "/ *<path name=\"low-latency-playback quat_i2s\">/a\      <ctl name=\"SLIMBUS_0_RX Audio Mixer MultiMedia5\" value=\"1\" \/>\n\
      <ctl name=\"RX0 HPF cut off\" value=\"MIN_3DB_150Hz\" \/>\n\
      <ctl name=\"RX0 Digital Volume\" value=\"84\" \/>\n\
      <ctl name=\"RX7 Digital Volume\" value=\"84\" \/>\n\
      <ctl name=\"SLIM_0_RX SampleRate\" value=\"KHZ_96\" \/>" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml
sed -i "/ *<path name=\"compress-offload-playback quat_i2s\">/a\      <ctl name=\"SLIMBUS_0_RX Audio Mixer MultiMedia4\" value=\"1\" \/>\n\
      <ctl name=\"RX0 HPF cut off\" value=\"MIN_3DB_150Hz\" \/>\n\
      <ctl name=\"RX0 Digital Volume\" value=\"84\" \/>\n\
      <ctl name=\"RX7 Digital Volume\" value=\"84\" \/>\n\
      <ctl name=\"SLIM_0_RX SampleRate\" value=\"KHZ_96\" \/>" $MODPATH/system/vendor/etc/mixer_paths_tavil.xml
