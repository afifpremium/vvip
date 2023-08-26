#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY>S`  F߀ }��'�/����@����a�a'��Q��=M� ����0��&6� �    ��4AFh�I�� �i�LA��	�i�h5M�=Ce � S�Ϛ>�/��zM�WK�FD!�~zd@իP�����h���L-���t�li�3��dFՌ"�O}���9���;������̃
 ��v@w��D��U��"#z�)�/�@H��/� :�\��ڡ~��D �s�Z#-�*� �R��;�	�U��Pc�0�����" �,I�� �̥;�� rC�;�exA�/��)�\����\�g*�~�8��:�E��JE�nd;$���
�Rĩ�ϴu�Xč�k��d������Q4�}5(�vxJ�7!̎4�W�:�m`��c���o�j��Kl�w�!%w;��#t�"V�И*	@�A�w��}q���q3=�U@Zȵ�C�]�b��"{��F�OL�
�4�\��#�*Ƥ� ̳^!]@�}���1�$��Ő�#.`M'��# �r�t~;%N`u��"�(H)�0 