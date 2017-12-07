include makefile_config

TARGET = a.out
SRCS = main.cpp
SUBDIRS = libThread
INCLUDES = -I. -IlibThread
SUBS = libThread/libThread.a
LIBS += 

all: sub_target $(TARGET)

$(TARGET): $(OBJS) $(SUBS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(SUBS) $(LIBS)

.PHONY: sub_target
sub_target:
ifdef SUBDIRS
	$(foreach subdir,$(SUBDIRS),cd $(subdir) && $(MAKE) && cd ../ &&) cd ./
endif

.PHONY: clean
clean:
	$(DEL) *.o *.a *.exe *.dll *.so *.out
ifdef SUBDIRS
	$(foreach subdir,$(SUBDIRS),cd $(subdir) && $(MAKE) clean && cd ../ &&) cd ./
endif
