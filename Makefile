SCRIPT_NAME = kbdrgb.sh

all:
	@echo "Run 'make install' to install $(TARGET_NAME) into $(INSTALL_DIR)."

install:
	cat $(SCRIPT_NAME) >> ~/.bashrc

uninstall:
	@echo "I'm too lazy to write uninstall code. Just remove kbdr function from your bashrc."

clean:
	@echo "No build artifacts to clean."
