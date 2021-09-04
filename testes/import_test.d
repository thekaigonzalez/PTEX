import std.stdio;
import std.file;
import std.array;
void main() {
writeln("this will run the files. I guess.." );
// we're going to include std.net.curl and try to run the "get()" function. 
// PTEX does not include the "std.net.curl" module by default, so we're going to have to include it ourselves. 
import std.net.curl; 
// now lets run it. 
char[] example = get("https://example.com");
writeln(example );
}
