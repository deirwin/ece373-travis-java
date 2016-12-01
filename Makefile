all:
	javac HelloWorld.java
	javac test/*.java

test:
	testscript.sh

clean:
	rm *.class test/*.class
