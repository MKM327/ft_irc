
NAME        := ircserv
CC         := c++
FLAGS    := -Wall -Wextra -Werror -std=c++98

SRCS        :=      main.cpp \
						checks.cpp\
						error.cpp\
						Client.cpp\
						Numeric.cpp \
						Server.cpp\
						Channel.cpp\
						Utils.cpp \
						HandleMessage.cpp \
						commands/Pass.cpp \
						commands/Nick.cpp \
						commands/User.cpp \
						commands/Join.cpp \
						commands/Topic.cpp\
						commands/Part.cpp\
						commands/Privmsg.cpp\
						commands/Quit.cpp\
						commands/Kick.cpp\
						commands/Names.cpp\
						commands/Cap.cpp\
						commands/Who.cpp\
						commands/Mode.cpp\
						commands/Notice.cpp\
						commands/Ping.cpp\

OBJS        := ${SRCS:.cpp=.o}

.cpp.o:
	${CC} ${FLAGS} -c $< -o ${<:.cpp=.o}

RM		    := rm -f

${NAME}:	${OBJS}
			${CC} ${FLAGS} -o ${NAME} ${OBJS}

all:		${NAME}

bonus:		all

clean:
			@ ${RM} *.o */*.o */*/*.o

fclean:		clean
			@ ${RM} ${NAME}

re:			fclean all

.PHONY:		all clean fclean re


