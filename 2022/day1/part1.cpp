#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main() {
    ifstream in;
    in.open("input.txt");
    string line;
    unsigned int curcal = 0;
    unsigned int curmax = 0;
    while (getline(in,  line)) {
        if (line.length() == 0) curcal = 0;
        else {
            curcal += stoi(line);
            if (curcal > curmax) {
                curmax = curcal;
            }
        }
    }

    cout << "Max calories: " << curmax << endl;

    in.close();

    return 0;
}