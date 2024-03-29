# cafe-common.m4
#
#   Copyright (C) 2011 Perberos <perberos@gmail.com>
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

dnl CAFE_COMMON_INIT

AC_DEFUN([CAFE_COMMON_INIT],
[
  dnl this macro should come after AC_CONFIG_MACRO_DIR
  AC_BEFORE([AC_CONFIG_MACRO_DIR], [$0])

  dnl ensure that when the Automake generated makefile calls aclocal,
  dnl it honours the $ACLOCAL_FLAGS environment variable
  ACLOCAL_AMFLAGS="\${ACLOCAL_FLAGS}"
  if test -n "$ac_macro_dir"; then
    ACLOCAL_AMFLAGS="-I $ac_macro_dir $ACLOCAL_AMFLAGS"
  fi

  AC_SUBST([ACLOCAL_AMFLAGS])
])

AC_DEFUN([CAFE_DEBUG_CHECK],
[
	m4_ifdef([AX_CHECK_ENABLE_DEBUG],[
		AX_CHECK_ENABLE_DEBUG([
			m4_default([$1],[no])],[
			CAFE_ENABLE_DEBUG])],[
		AC_MSG_ERROR([You need to install the autoconf-archive package.])
	])
])

dnl CAFE_MAINTAINER_MODE_DEFINES ()
dnl define DISABLE_DEPRECATED
dnl
AC_DEFUN([CAFE_MAINTAINER_MODE_DEFINES],
[
	AC_REQUIRE([AM_MAINTAINER_MODE])

	DISABLE_DEPRECATED=""
	if test $USE_MAINTAINER_MODE = yes; then
	        DOMAINS="G ATK PANGO CDK GDK_PIXBUF CTK CAFE LIBGLADE BTE WNCK LIBSOUP"
	        for DOMAIN in $DOMAINS; do
	               DISABLE_DEPRECATED="$DISABLE_DEPRECATED -D${DOMAIN}_DISABLE_DEPRECATED -D${DOMAIN}_DISABLE_SINGLE_INCLUDES"
	        done
	fi

	AC_SUBST(DISABLE_DEPRECATED)
])
