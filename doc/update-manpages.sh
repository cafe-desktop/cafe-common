#!/bin/sh

if [ -x /usr/bin/txt2man ]; then

	txt2man \
		-d "`date -R`" \
		-P cafe-autogen \
		-t cafe-autogen \
		-s 1 \
		cafe-autogen.txt > cafe-autogen.1

	txt2man \
		-d "`date -R`" \
		-P cafe-doc-common \
		-t cafe-doc-common \
		-s 1 \
		cafe-doc-common.txt > cafe-doc-common.1

else

	echo "Install txt2man package to update manpages"

fi
