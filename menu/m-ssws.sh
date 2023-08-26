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
BZh91AY&SYݠ�/ Q_�~}���?������ D@ PVi���ڻ76n˷\�$�=4i�=OI�C'��i���3D����CF��h�J~�M�z5L�i��ha4�@DBSЁ��A�@4�hCC@�� Ѡ�bh2CF&#@ E	���&�bjz�L��4�A�ڃ@��H�M����j�����/R8=#/kjJ#y8!��7��S̱�ZU֧�NS��%��y��{n�cp�fϏ�^����$���8���6�ҷ�ɾo��)nJ2�9p�����fȵ�^�;sS������%��E���^�ۂ8�q:���^���a�����H�
L�̤�M�q� u��ic�<N�>b�Y��\�N^q�^��3�ݰq�0���;,�(����n$�{cE�SNt�'�գ��^�[H���]ߗ�UB$gDK����\21�B�d�@�-���q�V��O��:�R�I����HQ�B�m�+�1%�/T��Yf�,�ꢬ����
+�ړo<�e�j���J^yn~y(�>e�L���.$�.Rs�A!��׵iB��`I�T��kqTEJ��d�f#I��N���B�eF�u \��fffffx��r{4�3��F˂��ӹ�?��<���~�µ�jC+Z��G �b2�;m(#v�)@�G5��V�f*9���e��?���w��tΙ�0e?D�y�7��Cv5�v�8�7"�,J�)sB: H�ˢ�\ss�%S+EE�(%�R�Ц��X+��D�æ�X�IO��1-��2�#N3����s,Y���C%)�m��ij�ҋ��Y?<��-�`�2�wF�a�����> EQ9�YY~MQ",�^���ȸ�Uڹ|�J���!�RT�'�)��2Q�ow<�b�Ŭ$B��aI�z��>�j����ɈpK@�����5�.���16s�[QI�kG6lq��)pU{���3�BeK	����/N��T��g%�K���`�6cc��~����N����&�G�$x��	%������oZ4�h���#1�员g��L�y�w��f}'�Z"uF��8LKq�TE_�Цd�����q6�h�j�S�yo���4�M`��`�q3o�N�
˸���"��s�<3DFw$)�1t�4��^N�
����D7B�����N�K���	&�r	�kj�e$��˔�f�!�]����E��.�H�$oRl����w{H����y3⯪�<h�@,W7Q8�H"db���N�T��D� tP����:F���b"�l%<��s��P)���d#"�7X���szQ6�F	�V�!Iy�3�
�B��3lJЦ���N=��ފK5���k8����B�tB�BgK������"�(Hn�m�