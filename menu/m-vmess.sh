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
BZh91AY&SY�B� Z��~}���?������ D@ PVil�6�M�������I&B4hF)��OS#52(z�Ԟ����L����AF�?SM#LF	��m@����ш�DHFA�zF���A�#@m&�M   82 ɦ!�� �0��4bb4  $�B#P�6�@6�C�� Ph4�$ܤ[
U�r�K܎H���%�:a��7��䬾�T����v�t%��������>�_,��jI��qUiBxҮ߄����ð��9)Jq�槓N~,[J�)��mF����"w(j;���h?cn�N�t+��71���U8[d��Ŏ��4���ځ�jş7A�u�|��V��N�J�
}��Z�m�+���˰o��Xg$��RP�l�Z�x�JBz�j�Jb�͓^9M*��nu�Uqb9-�(d���]�J	�ҀIm�7����ܪ�ń���bI�����SF����R�'�@�IC��i�=4�k��#?O�ɏ'u�c�hY�u�֓��ی���	62t��GT�Μ���ɂL% Jm2s�HD�qܢ1�FI�( �h˩�X�cd��� �N�!��m�۔��������N���t�og{�v^~���]%��TssB�1lܬ�`9�W,I�"<҂��疲V��sU��##N?L�W7Ͷ�|�In擆�1��n�lj0��"��,D�����?3\*�Z*.":� �ZAXa/Z�$P�@�`-p��ڪ��1���It����E������ZR|���Jb[a�	4�I4��˽��E]$d�x�U٠e�9��N�r|!!*����2��8�,�pyכz�5hw�s|��9qM�d�K��o�EY6rHV m��>���ަ���𣑐�H��%�����ep*YU��bks@���ey]����(�E!�����
��2��@a�찒�Rm�j�A�ۿI�
 ��f1�Ҥq�l�䵴U9�=q"��諥�����
ё#@������nY��T�g}���)����M4V'�x��E��Eg���Z��ii�\b�9� �R�[6VH�=;�@#xg����b��r��EY��>xf���)L���W����Z�!�mě�x
�c!
!���tx�[`s$�Kh�j(���	�a�fXUP�Ф�/�*p�eh�Z���̠.�
r�+����(oiv�<��O%�����ёA Du����]��R�W���j��D�K��'�`�&	���0�9����P)���d#%|��)V�)d��܉�H[k�,�eMl�����P� ��6ؖ1T�9af�����$�i��w�է~qc�	�I	�v������H�
�R 