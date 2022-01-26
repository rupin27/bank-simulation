_DEPS = atm.h bank.h command.h errors.h hw.h trace.h
_OBJ = atm.o bank.o command.o errors.o trace.o
_MOBJ = main.o
_TWRITEROBJ = twriter.o
_TREADEROBJ = treader.o
_TOBJ = test.o

APPBIN = bank_app
TWRITERBIN = twriter
TREADERBIN = treader
TESTBIN = bank_test

IDIR = include
CC = g++
CFLAGS = -I$(IDIR) -Wall -Wextra -g -pthread
ODIR = obj
SDIR = src
LDIR = lib
TDIR = test
LIBS = -lm
XXLIBS = $(LIBS) -lstdc++ -lgtest -lgtest_main -lpthread
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))
MOBJ = $(patsubst %,$(ODIR)/%,$(_MOBJ))
TOBJ = $(patsubst %,$(ODIR)/%,$(_TOBJ)) 
TWRITEROBJ = $(patsubst %,$(ODIR)/%,$(_TWRITEROBJ))
TREADEROBJ = $(patsubst %,$(ODIR)/%,$(_TREADEROBJ))
$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(ODIR)/%.o: $(TDIR)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

all: $(APPBIN) $(TESTBIN) $(TWRITERBIN) $(TREADERBIN) submission

$(APPBIN): $(OBJ) $(MOBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

$(TWRITERBIN): $(OBJ) $(TWRITEROBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

$(TREADERBIN): $(OBJ) $(TREADEROBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

$(TESTBIN): $(TOBJ) $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(XXLIBS)

submission:
	zip -r submission src lib include


.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~
	rm -f $(APPBIN) $(TESTBIN) $(TWRITERBIN) $(TREADERBIN)
	rm -f submission.zip
