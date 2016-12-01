all:
	javac *.java

testscript:
	rm -f test/*.out
	./testscript.sh

clean:
	rm -f *.class test/*.out
