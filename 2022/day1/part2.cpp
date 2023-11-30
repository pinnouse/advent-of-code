#include <iostream>
#include <fstream>
#include <string>

using namespace std;

#define SIZE 3

void addToMax(unsigned int *curmax, unsigned int val) {
    for (int i = 0; i < SIZE; i++) {
        if (val > curmax[i]) {
            for (int j = SIZE - 1; j > i; j--) {
                curmax[j] = curmax[j-1];
            }
            curmax[i] = val;
            break;
        }
    }
}

int main() {
    ifstream in;
    in.open("input.txt");
    string line;
    unsigned int curcal = 0;
    unsigned int curmax[SIZE];
    for (int i = 0; i < SIZE; i++) {
        curmax[i] = 0;
    }
    while (getline(in,  line)) {
        if (line.length() == 0) {
            addToMax(curmax, curcal);
            curcal = 0;
        } else {
            curcal += stoi(line);
        }
    }

    int s = 0;
    for (int i = 0; i < SIZE; i++) {
        s += curmax[i];
        cout << "Max calories " << i << " : " << curmax[i] << endl;
    }
    cout << "Total calories: " << s << endl;

    in.close();

    return 0;
}