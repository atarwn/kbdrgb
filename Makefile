INSTALL_DIR = /usr/bin
SCRIPT_NAME = kbdrgb.sh
TARGET_NAME = kbdrgb

all:
	@echo "Run 'make install' to install $(TARGET_NAME) into $(INSTALL_DIR)."

install:
	sudo install -m 755 $(SCRIPT_NAME) $(INSTALL_DIR)/$(TARGET_NAME)

uninstall:
	sudo rm -f $(INSTALL_DIR)/$(TARGET_NAME)

clean:
	@echo "No build artifacts to clean."
