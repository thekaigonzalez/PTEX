all:
	dmd parser.d -lib
	dmd ptex.d parser.a
