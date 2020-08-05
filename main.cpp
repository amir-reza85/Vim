#include <iostream>
#include <graphics.h>
using namespace std;

void asl() {
    setcolor(2);
    line(0, 430, 1400, 430);
    setcolor(15);
}

void sangs(int sangx, int sangx2) {
    asl();
    setcolor(0);
    rectangle (sangx + 30, 430, sangx + 20, 420);
    asl();
    setcolor(0);
    rectangle (sangx2 + 30, 400, sangx2 + 20, 390);
    asl();
    setcolor(15);
    rectangle (sangx, 430, sangx - 10, 420);
    asl();
    setcolor(15);
    rectangle (sangx2, 400, sangx2 - 10, 390);
    asl();
}

void adam (int x, int y) {
    circle(x, y, 10);
    line(x, y + 10,x, y + 20);
    line(x, y + 20, x + 10, y + 30);
    line(x, y + 20, x - 10, y + 30);
    line(x, y + 15, x - 10, y + 10);
    line(x, y + 15, x + 10, y + 10);
}

int play() {
    int x = 50, y = 400, xb = -100, yb = -100;
    int up = 0, down = 0;
    srand(time(NULL));
    int sanga[100];
    int sanga2[100];
    for (int i = 0; i < 100; i++) {
        sanga[i] = rand() % 80 + 20;
        sanga[i] *= 10;
        sanga2[i] = rand() % 80 + 20;
        sanga2[i] *= 10;
        while (abs(sanga[i] - sanga2[i]) <= 200) {
            sanga[i] = rand() % 80 + 10;
            sanga[i] *= 10;
            sanga2[i] = rand() % 80 + 10;
            sanga2[i] *= 10;
        }
        sanga[i] += (i * 1000);
        sanga2[i] += (i * 1000);
    }
    asl();
    while (true) {
        //sangx2 = sangx + 100;
        for (int i = 0; i < 100; i++) {
            sangs(sanga[i], sanga2[i]);
        }
        asl();
        //line(0, 390, 1400, 390);
        //line(0, 450, 1400, 450);
        setcolor(0);
        for (int i = max(0, x / 100 - 10); i < x / 100 + 10; i++) {
            sangs(sanga[i], sanga2[i]);
        }
        setcolor(0);
        adam(xb, yb);
        setcolor(15);
        adam(x, y);
        //cout << xb << ' ' << yb << ' ' << x << ' ' << y << endl;
        for (int i = max(0, x / 100 - 10); i < x / 100 + 10; i++) {
            if (abs(x - sanga[i]) <= 10 && (y >= 390 && y <= 450)) {
//               getch();
                goto end;
            }
            if (abs(x - sanga2[i]) <= 10 && (y >= 360 && y <= 400)) {
//               getch();
                goto end;
            }
        }
        xb = x, yb = y;
        delay(300);
        char ch = ' ';
        if (kbhit()) {
            ch = getch();
            ch = tolower(ch);
        }
        if (ch == 's' && up == 0 && down == 0) {
            down = 4;
        }
        if (ch == 'd') {
            x += 10;
        }
        if (ch == 'a') {
            x -= 10;
        }
        if (down > 2) {
            y += 10;
            down--;
        }else if (down > 0) {
            y -= 10;
            down--;
        }
        if (ch == 'w' && up == 0 && down == 0) {
            up = 6;
        }
        if (up > 3) {
            y -= 10;
            up--;
        }else if (up > 0) {
            y += 10;
            up--;
        }
        asl();
        for (int i = 0; i < 100; i++) {
            sanga[i] -= 30;
            sanga2[i] -= 30;
        }
    }
    end:

    setfillstyle(1,0);
    floodfill(5,5,7);
    settextstyle(6,0,8);
    setcolor(4);
    outtextxy(300,300,"Game over");
    settextstyle(6,0,4);
    setcolor(2);
    outtextxy(300,500,"Click Q for Exit or Click R for new game");
    while (true) {
        char ch = tolower(getch());
        if (ch == 'q') {
            return 1;
        }
        if (ch == 'r') {
            setfillstyle(1,0);
            floodfill(5,5,7);
            return play();
        }
    }
}

main()
{
    initwindow(1400,800);
    return play();
}
/*
W : bala
S : payin
A : chap
D : rast
*/
