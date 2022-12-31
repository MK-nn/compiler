no_arg:
	@echo '以下のように実行してください'
	@echo 'make compile'
	@echo 'or'
	@echo 'make clean'

.PHONY: compile
.PHONY: clean
compile:
	bison -dv -y Expr.y
	flex -l Expr.l
	gcc y.tab.c lex.yy.c -ly -ll -lm

clean:
	rm -f y.tab.c y.tab.h a.out