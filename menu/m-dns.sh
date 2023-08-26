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
BZh91AY&SY�� ��Q� ����߮����@D@  `�e÷�f�T��P�d��&I��SzI�M4���he44h44ɦi<��h��3Jx���H  4 �    �� h4 ��L�hh�  h H��#Bd2j#�O&�@��4d��� &�48h �A�0@4���2 b����MO&�O#%=�l����i�F���=OS@I5��A3��D���u�ȌD촸c�ۑ5���� j���h��P���Hjj��P�z�7>�ޙ� ΅���0��m�!���hq^�������LC3W������=��W�u�^��+X�q��yX
���Y���W$I�o�K� 5���ʳ�j<Ʒ�`\ Qv��5+]_�r�G�9�=/kEmdd�p�۾�txH^�.�Y�P�V��xaPN�I�Ӗh+�^hJ,FW�l��&����W�ɺr<1|}!��)'V���'W}N�%S�#=�9EꞰ�XĐ1��"٦�`�$�W�W��:�B�1ė#kA�.$-�IM��\2�	:b@F �aW�L5i�����YM9@�s(�I�C�HUTZ��st�oW˱�����w��@��˛LR���;�y��v.'��5n�k\��y#\�q> �y�@�@�p�"�7���4�M��}�P��:���'7��#<|�v5�k޽,�d���>�B�9AWwTvh����F�=iLw���[4�űѺ���@@���S2�*es�VX�q�DdM�7Ľ��v�|=���`R�|�Ͷߔ�m���]�;\:����.��$I�ج��Dſ�|Y�����Zj �M�1@}V�o��jڙX3=T$��0�=��&a�V��� v
�o p�Fi�G�G)���������NٟdO��q
�q�����)	�z�i�wd�LZ��iত���NV��8"	 ���������@��C;�$���^Xs6��kjD<��ݾ_2����C�"�%d	�p ���2�����x����xa�V\�뾠�"�� ��3-(`���V=Dgr%�����*b��?=���:�W ��1f"s^:��v�5ux�5�$\O����J#����}�ՄKb�LqD!�t)�N��᫮����jy����1�T���c���4҆����y$E�)|��ë���G%�9h��e-|�Ҙ"��t�<W�
�~��$�id$�~�wIka���q��Y�W2X"�K��5�9J�)��m+ˎ��g6:3��-Ϳu�Zܚg�	W(FƎ�2���x�T2�V��Vb�К
�ⵕ&	;�q�s,E���z���s]X�K��U֜S-��5�I�{���Yt��:�J([Լg��٠�d�vv�3q�n�ٷb�99ɺ�pvY��ղ����-���r]%uw��SS}5�&LJI�������|oE�|�I���mfmӌp5.ZQ16E�x�E��3,m�J.at"j
u�qW��K/�_w8���,�u�Uj�![p��a��P��$��+C�=�\u�k���-�b ��O����s!��ndc��*8�&)�a�pzV�����l6�t�.��/����a^�Kt���32!��o5�+��c��<2�~�tg�+7�U��-(�e���]�#�є���ڊ��V7S%G-֌�wǰd����jh�pV���Z�'e)׺�P2�E9z�������Fm����C�#aCCR��
�.�Ԋ�����w'[6&0.m�A�᱖wq�:L#�נ�n�zT�&�!TKH�u"iF�),� $X�{Ē�N/G"A����JHi1�ބ��� b�a�@��!CP�	Q���4�_���)�p/4