#!/bin/sh
#
# verlihub entrypoint
# Vlz, 2023
#
export VERLIHUB_CFG=/etc/verlihub
VERLIHUB_EXEC=/usr/local/bin/verlihub
cd ${VERLIHUB_CFG}
if [ ${DO_NOT_LINK_PLUGINS} ]; then
    echo "Skipping plugin symlink creation as requested";
else
    echo "Creating symlings to ${VERLIHUB_CFG}/plugins/";
    ln -s /usr/local/lib/libplug_pi.so /etc/verlihub/plugins/
    ln -s /usr/local/lib/liblua_pi.so  /etc/verlihub/plugins/
fi

# chown and later run process as verlihub with requested UID
if [ ${VH_UID} ]; then
    echo "Creating verlihub user with UID: ${VH_UID}"
    adduser -H -D -h /etc/verlihub -u ${VH_UID} verlihub verlihub
    chown verlihub:verlihub -R /etc/verlihub /usr/share/GeoIP
    VERLIHUB="/bin/su verlihub -c ${VERLIHUB_EXEC}"
else
    VERLIHUB=${VERLIHUB_EXEC}
fi

echo "Starting verlihub"

# 0 = !quit or errors while starting
# 1 = !restart happened

EXITCODE=1

while [ ${EXITCODE} -eq 1 ]
do
  sleep 1s
  echo "Executing: ${VERLIHUB}"
  ${VERLIHUB}
  EXITCODE=$?
  echo "verlihub died with exitcode: ${EXITCODE}"
  test ${EXITCODE} -eq 1 && echo "!restart happened"
done

return 0
