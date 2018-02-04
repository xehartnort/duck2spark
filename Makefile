SCRIPT_NAME=test.duck
ARD_SKETCH=sketch/test.ino
KEYBOARD_CONF=es

all: compile upload

compile:
	java -jar ./encoder.jar -i $(SCRIPT_NAME) -o ./raw.bin -l $(KEYBOARD_CONF)
	./duck2spark.py -i raw.bin -l 1 -o $(ARD_SKETCH)

upload:
	arduino --upload $(ARD_SKETCH)

clean:
	rm raw.bin
	rm $(ARD_SKETCH)

