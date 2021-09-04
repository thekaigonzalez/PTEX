import std.array;
import std.stdio;
import std.file;
import std.getopt;
import std.string;
import parser;
import std.process;

void live_session() {
 writeln("FreePTEX interpreter version 1.0");
 initialize("session.ptex.d");
 while (1) {
  write(">");
  string statement = readln();
  parse(statement, "session.ptex.d");
 }
}


void main(string[] args) {
 bool live = false;
 string file = "none";
 string generated_file = "a.d";
 bool do_build_after_compile = false;
 try {
  getopt(args, std.getopt.config.bundling, "live-session|l", &live, "file|f", &file, "output|o", &generated_file);
 } catch (GetOptException e) { writeln("bad usage");  }
 if (live) {
  live_session();
 }
 if (file != "none") {
  File fe = File(file, "r");
  initialize(generated_file);
  while (!fe.eof()) {
   string line = chomp(fe.readln());
   if (line == null) {
     writeln("warning: null line");
   } else {
    parse(line, generated_file);
   }
  }
  stop_file(generated_file);
  if (do_build_after_compile)
  {
   executeShell("dmd "~generated_file~" -O");
  }
 }
}
