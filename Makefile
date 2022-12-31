no_arg:
	@echo '以下のように実行してください'
	@echo 'make <コンパイルしたいもの(ex. calc1, calc2)>'
	@echo 'or'
	@echo 'make clean'

.PHONY: calc1
.PHONY: calc2
.PHONY: calc3
.PHONY: calc4
.PHONY: clean

calc1:
	bison -y calc1.y
	gcc y.tab.c -ly

calc2:
	bison -y calc2.y
	gcc y.tab.c -ly

calc3:
	bison -y calc3.y
	gcc y.tab.c -ly

calc4:
	bison -dv -y calc4.y
	flex -l calc4.l
	gcc y.tab.c lex.yy.c -ly -ll -lm

clean:
	rm -f y.tab.c y.tab.h a.out