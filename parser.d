import std.stdio;
import std.file;
import std.array;

void initialize(string file)
{
  File f = File(file, "w");
  f.writeln("import std.stdio;\nimport std.file;\nimport std.array;\nvoid main() {");
  f.close();
}

void parse(string statement, string filep) {
 File f = File(filep, "a");
 string[] TexState = statement.split;
 if (TexState.length == 0) { writeln("stdin: no lines ?");  }
 if (TexState[0] == "PRINT") {
    string ps = "";
    foreach (string e; TexState) {
      if (e == "PRINT") { continue; } // do not iterate over keyword (skip)
      else {
	ps = ps~e~" ";
      }
    }
    f.writeln("writeln("~ps~");");
 } else if (TexState[0] == "INPUT") {
   f.writeln("string "~TexState[1]~" = readln();");
 } else if (TexState[0] == "COM") {
  string ps = "";
  foreach(string e; TexState) {
   if (e == "COM") { continue; }
   else {
    ps = ps~e~" ";
   }
  }
  f.writeln("// "~ps);

 } else if (TexState[0] == "RAW") {
   string ns = "";
   foreach (string e; TexState) {
      if (e == "RAW") {
	continue;
      }
      else {
	ns = ns~e~" ";
      }
   }
   f.writeln(ns);
  } else if (TexState[0] == "ASSIGN") {
   foreach (string e; TexState) {
	if (e == "ASSIGN") {
	 continue;
	} else {   }
   }
   f.writeln(TexState[1]~" "~TexState[2]~" = "~TexState[3]); 
  }

  f.close();
}

void stop_file(string file)
{
 File f = File(file, "a");
 f.writeln("}");
 f.close();
}
