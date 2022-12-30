no_arg:
	@echo '以下のように実行してください'
	@echo 'make compile'
	@echo 'or'
	@echo 'make clean'

.PHONY: compile
.PHONY: clean
compile:
	bison -y Expr.y
	gcc y.tab.c -ly

clean:
	rm -f y.tab.c y.tab.h a.out