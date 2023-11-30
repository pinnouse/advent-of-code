#include <iostream>
#include <fstream>
#include <unordered_map>
#include <string>

using namespace std;

int main() {

    unordered_map<string, int> umap;
    umap["A X"] = 3 + 1;
    umap["A Y"] = 6 + 2;
    umap["A Z"] = 0 + 3;
    umap["B X"] = 0 + 1;
    umap["B Y"] = 3 + 2;
    umap["B Z"] = 6 + 3;
    umap["C X"] = 6 + 1;
    umap["C Y"] = 0 + 2;
    umap["C Z"] = 3 + 3;

    ifstream in;
    in.open("input.txt");

    string line;
    unsigned int total = 0;

    while (getline(in, line)) {
        if (line.length() == 0) continue;
        total += umap[line];
    }

    cout << "Total score: " << umap << endl;

    return 0;
}