all:
	javac HelloWorld.java
	javac test/*.java

testscript:
	./testscript.sh

clean:
	rm *.class test/*.class
