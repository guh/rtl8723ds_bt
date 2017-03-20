CC := cc
PREFIX :=

rtk_hciattach:hciattach.c hciattach_rtk.o
	$(CC) -o rtk_hciattach hciattach.c hciattach_rtk.o

hciattach_rtk.o:hciattach_rtk.c
	$(CC) -c hciattach_rtk.c

clean:
	rm -f *.o  rtk_hciattach

install:
	mkdir -p $(PREFIX)/lib/firmware/rtlbt
	mkdir -p $(PREFIX)/sbin
	cp -p firmware/rtl8723d_fw $(PREFIX)/lib/firmware/rtlbt/
	cp -p firmware/rtl8723d_config $(PREFIX)/lib/firmware/rtlbt/
	cp -p rtk_hciattach $(PREFIX)/sbin/
	cp -p scripts/start-rtl-bluetooth $(PREFIX)/sbin/

