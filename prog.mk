
# prog.mk - GNU Make script for simple C programs
#
# Written in 2018 by Joseph Davis <davisj2@tcd.ie>
#
# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any
# warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication
# along with this software. If not, see
#        <http://creativecommons.org/publicdomain/zero/1.0/>

all: ${PROG}

OBJS := ${SRCS:.c=.o}
DEPS := ${SRCS:.c=.d}

CFLAGS += -Wall -Wextra -std=c11 -O2 -pedantic
CPPFLAGS += -MMD -MP
LIBS +=
LDFLAGS +=

XOPEN_SOURCE ?= 700

ifeq ($(NDEBUG),1)
  CPPFLAGS += -DNDEBUG=1
else
  CFLAGS += -g
endif

ifeq ($(USE_XOPEN),1)
  CPPFLAGS += -D_XOPEN_SOURCE=${XOPEN_SOURCE}
endif

${PROG}: ${OBJS}
	@printf "  LD\t%s\n" "${PROG}"
	@${CC} ${LDFLAGS} -o ${PROG} ${OBJS} ${LIBS} 

%.o: %.c
	@printf "  CC\t%s\n" "${PROG}"
	@${CC} ${CFLAGS} ${CPPFLAGS} -c -o $@ $<

-include ${DEPS}

clean:
	@rm -f ${OBJS} ${DEPS} ${PROG}
