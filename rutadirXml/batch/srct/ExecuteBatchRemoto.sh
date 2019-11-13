#!/bin/bash
. /remote/bdfv_contingencia/batch/srct/remoteConfig.ini 
echo "usuario remoto para conexion="${REMOTE_USER}
CMD=". "$REMOTE_SHELL
INGRESO_PATH_CMD="cd "$REMOTE_PATH
echo $CMD 

VAR=$(expect -c "
set timeout 60
spawn ssh $REMOTE_USER@$REMOTE_HOST
expect \"*?assword:*\"
send -- \"$REMOTE_PASS\r\"
expect \"*#*\"
send -- \"bash\r\"
send -- \"$INGRESO_PATH_CMD\r\"
send -- \"\r\"
send -- \"$CMD\r\"
expect \"*#*\"
expect eof
")
echo "==============="
echo "$VAR"