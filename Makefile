all:
	javac *.java

testscript:
	./testscript.sh

clean:
	rm -f *.class test/*.out
